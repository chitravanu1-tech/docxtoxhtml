import boto3
import json
import sys
import os
import io, shutil
from pathlib import Path
from botocore.exceptions import NoCredentialsError, ClientError

def zipFilesInDir(dirName, zipFileName):
    filePath = dirName + '/' + os.path.basename(zipFileName) + '.zip'
    if os.path.exists(filePath):
        print(filePath)
        os.remove(filePath)
    shutil.make_archive(zipFileName, 'zip', dirName)

def get_secret(secret_name, aws_access_key_id, aws_secret_access_key, region_name='us-east-1'):
    client = boto3.client(
        'secretsmanager',
        aws_access_key_id=aws_access_key_id,
        aws_secret_access_key=aws_secret_access_key,
        region_name=region_name
    )
    try:
        response = client.get_secret_value(SecretId=secret_name)
    except ClientError as e:
        print(f'Error fetching secret: {e}')
        return None

    if 'SecretString' in response:
        return json.loads(response['SecretString'])
    else:
        return json.loads(response['SecretBinary'].decode('utf-8'))

def WriteLog(output_file_xml, xml_content):
    try:
        with open(output_file_xml, "w", encoding="utf-8") as f:
            f.write(xml_content)
    except Exception as exx:
        print(exx)

def upload_zip_to_s3(local_zip_path, bucket, s3_key, aws_access_key_id, aws_secret_access_key, region_name='us-east-1'):
    s3 = boto3.client(
        's3',
        aws_access_key_id=aws_access_key_id,
        aws_secret_access_key=aws_secret_access_key,
        region_name=region_name
    )
    local_txt_file = local_zip_path.replace('.zip', '.txt')
    try:
        with open(local_zip_path, 'rb') as f:
            s3.upload_fileobj(f, bucket, s3_key)
        print(f"Uploaded {local_zip_path} to s3://{bucket}/{s3_key}")
        WriteLog(local_txt_file, f"Uploaded {local_zip_path} to s3://{bucket}/{s3_key}")
    except FileNotFoundError:
        print(f"File not found: {local_zip_path}")
        WriteLog(local_txt_file, f"File not found: {local_zip_path}")
    except NoCredentialsError:
        print("AWS credentials provided are invalid or missing.")
        WriteLog(local_txt_file, "AWS credentials provided are invalid or missing.")
    except ClientError as e:
        print("Failed to upload:", e)
        WriteLog(local_txt_file, "Failed to upload:")

if __name__ == '__main__':
    pdfPath = sys.argv[1]
    pdfFileName = sys.argv[2]
    doiName = pdfFileName.replace('.pdf', '')
    doiFolder = str(Path(pdfPath).parent) + '/' + doiName

    if not os.path.exists(doiFolder):
        os.mkdir(doiFolder)

    jsonFile = str(Path(pdfPath).parent.parent) + '/FROM_CLIENT/PGM/' + doiName + '/' + doiName + '_Manifest.json'
    if not os.path.exists(jsonFile):
        print('Manifest.json file is missing')
        sys.exit(0)

    shutil.copy(jsonFile, doiFolder)
    shutil.move(pdfPath, doiFolder)

    zipFileUpload = str(Path(pdfPath).parent) + '/' + doiName
    zipFilesInDir(doiFolder, zipFileUpload)

    local_zip_path = zipFileUpload + '.zip'
    bucket = "pagemajik-test-temp"
    s3_key = "Journals/31354359/61253822/PDF/" + doiName + '.zip'

    # === Load AWS keys from JSON file ===
    with open("C:/Plos_PGM/aws_credentials.json") as f:  # update path
        creds = json.load(f)

    # aws_access_key_id_file = creds["aws_access_key_id"]
    # aws_secret_access_key_file = creds["aws_secret_access_key"]

    # === Fetch secret from AWS Secrets Manager ===
    # secret = get_secret(
    #     'Newgen-Test-EMSubmission',
    #     aws_access_key_id_file,
    #     aws_secret_access_key_file
    # )

    aws_access_key_id = creds["aws_access_key_id"]
    aws_secret_access_key = creds["aws_secret_access_key"]
    region_name = "us-east-1"

    upload_zip_to_s3(
        local_zip_path,
        bucket,
        s3_key,
        aws_access_key_id,
        aws_secret_access_key,
        region_name
    )
