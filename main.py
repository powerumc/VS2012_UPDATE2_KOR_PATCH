import requests
import progressbar
import zipfile
import io
import tempfile
import os

def _GetTempDir():
    dir = tempfile.mktemp();
    os.mkdir(dir)

    return dir



def _DownloadsPatch(dir):
    ISO = "https://github.com/powerumc/VS2012_UPDATE2_KOR_PATCH/archive/master.zip"
    CHUNK_SIZE = 1024 # 1MB

    r = requests.get(ISO)
    total_size = int(r.headers['content-length'])
    pbar = progressbar.ProgressBar(maxval=total_size).start()



    filepath = os.path.join(dir, "master.zip");
    print("Downloading... " + filepath)

    f = open(filepath, 'wb')

    file_contents = ""
    for chunk in r.iter_content(chunk_size=CHUNK_SIZE):
        file_contents += chunk
        pbar.update(len(file_contents))
        f.write(chunk)

    f.close()

    return filepath

def _Unzip(filepath):
    print("Extract unzipping...")
    dir = os.path.splitext(filepath)[0]
    zip = zipfile.ZipFile(filepath, "r")
    zip.extractall( dir )

    return os.path.join(dir, "master", "VS2012_UPDATE2_KOR_PATCH-master")

if __name__ == '__main__':

    #print(platform.processor() == True )

    #reg = _winreg.ConnectRegistry(None, HKEY_LOCAL_MACHINE)

    #key = _winreg.OpenKey(reg, "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\11.0\InstallDir")
    #print(key);

    #files = ['http://docs.python-requests.org/en/latest/index.html', 'https://github.com/powerumc/VS2012_UPDATE2_KOR_PATCH/blob/master/BasicMvcWebApplicationProjectTemplatev4.1.csaspx.zip']
    #CHUNK_SIZE = 1024 * 1024 # 1MB

    tempdir = _GetTempDir()

    filepath = _DownloadsPatch(tempdir)

    unzipdir = _Unzip(filepath)

    print(os.listdir(unzipdir))

    input()