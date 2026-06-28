import boto3
import time
import os
import json

# === Load AWS credentials from credentials.json ===
with open("C:\\PLOS_PGM\\credentials.json") as f:
    creds = json.load(f)

aws_access_key_id = creds["aws_access_key_id"]
aws_secret_access_key = creds["aws_secret_access_key"]

# === S3 Settings ===
bucket_name = "filebackup-editorwyciwyg"
folder_prefix = "Journals/31354359/61253822/OUT-XML"

# === Local download folder ===
download_folder = "C:\\PLOS_PGM"
os.makedirs(download_folder, exist_ok=True)

# === Track already downloaded files ===
downloaded_files = set(os.listdir(download_folder))

# === Create S3 client ===
s3 = boto3.client(
    "s3",
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key
)

print(f"Watching bucket '{bucket_name}' in folder '{folder_prefix}'...")

# === Infinite loop to check for new files ===
while True:
    try:
        response = s3.list_objects_v2(Bucket=bucket_name, Prefix=folder_prefix)

        if 'Contents' in response:
            for obj in response['Contents']:
                key = obj['Key']
                filename = os.path.basename(key)

                # Skip if folder path or already downloaded
                if not filename or filename in downloaded_files:
                    continue

                local_path = os.path.join(download_folder, filename)
                print(f"Downloading: {key} → {local_path}")
                s3.download_file(bucket_name, key, local_path)
                downloaded_files.add(filename)
                s3.delete_object(Bucket=bucket_name, Key=key)
        else:
            print("No files found in the folder.")

    except Exception as e:
        print("Error:", e)

    time.sleep(60)  # Check every 60 seconds
