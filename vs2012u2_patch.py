import requests
import progressbar
import zipfile
import io
import tempfile
import os
import _winreg
import platform
import win32api
import win32con
import shutil



def _GetVsPath():
	regpath = None
	if platform.processor(): regpath = r"SOFTWARE\Wow6432Node\Microsoft\VisualStudio\11.0"
	else: regpath = r"SOFTWARE\Microsoft\VisualStudio\11.0"

	hKey = win32api.RegOpenKey (win32con.HKEY_LOCAL_MACHINE, regpath)
	value, type = win32api.RegQueryValueEx (hKey, "InstallDIr")
	
	return value


def _GetTempDir():
    dir = tempfile.mktemp()
    os.mkdir(dir)

    return dir

visited = []
def copy_file(src, dest):
    for path, dirs, files in os.walk(src, topdown=True):
        if path not in visited:
            for di in dirs:
                copy_file(os.path.join(path, di), os.path.join(dest,  di))
            if not os.path.exists(dest):
                os.makedirs(dest)
            for fi in files:
                shutil.copy(os.path.join(path, fi), dest)
            visited.append(path)


def _DownloadsPatch(dir):
    ISO = "http://github.com/powerumc/VS2012_UPDATE2_KOR_PATCH/archive/master.zip"
    CHUNK_SIZE = 1024 # 1MB

    r = requests.get(ISO, verify=False)
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
    dir = os.path.splitext(filepath)[0]
   
    print
    print("Extract unzipping... " + dir)
    zip = zipfile.ZipFile(filepath, "r")
    zip.extractall( dir )

    return os.path.join(dir, "VS2012_UPDATE2_KOR_PATCH-master")

def _Backup(unzipdir, pathdir):

	vsdir = _GetVsPath()

	for dir in patchdir:
		bdir = os.path.join(vsdir, r"ProjectTemplates\CSharp\Web\1042", dir)
		redir = bdir + ".bak"

		if os.path.exists(bdir) and os.path.exists(redir) == False:
			print("renamed " + redir)
			os.rename(bdir, redir)


def _Install(unzipdir, patchdir):
	print("unzipdir = " + unzipdir)
	vsdir = os.path.join(_GetVsPath(), r"ProjectTemplates\CSharp\Web\1042")

	for dir in patchdir:
		src = os.path.join(unzipdir, dir)
		des = os.path.join(vsdir, dir)

		if os.path.exists(src):
			print("Install... " + src)
			copy_file(src, des)

if __name__ == '__main__':

	patchdir = [ "BasicMvcWebApplicationProjectTemplatev4.1.csaspx", 
				"BasicMvcWebApplicationProjectTemplatev4.1.cshtml",
				"EmptyMvcWebApplicationProjectTemplatev3.01.csaspx",
				"EmptyMvcWebApplicationProjectTemplatev3.01.cshtml",
				"EmptyMvcWebApplicationProjectTemplatev4.1.csaspx",
				"EmptyMvcWebApplicationProjectTemplatev4.1.cshtml",
				"EmptyWebApplicationProject40",
				"MvcFacebookApplicationProjectTemplatev4.1.cshtml",
				"MvcIntranetProjectTemplatev3.01.csaspx",
				"MvcIntranetProjectTemplatev3.01.cshtml",
				"MvcIntranetProjectTemplatev4.1.csaspx",
				"MvcIntranetProjectTemplatev4.1.cshtml",
				"MvcMobileProjectTemplatev4.1.csaspx",
				"MvcMobileProjectTemplatev4.1.cshtml",
				"MvcSinglePageApplicationProjectTemplatev4.1.cshtml",
				"MvcWebApplicationProjectTemplatev3.01.cs",
				"MvcWebApplicationProjectTemplatev3.01.csaspx",
				"MvcWebApplicationProjectTemplatev3.01.cshtml",
				"MvcWebApplicationProjectTemplatev4.1.cs",
				"MvcWebApplicationProjectTemplatev4.1.csaspx",
				"MvcWebApplicationProjectTemplatev4.1.cshtml",
				"WebApiApplicationProjectTemplatev4.1.cshtml"]

	tempdir = _GetTempDir()
	filepath = _DownloadsPatch(tempdir)
	unzipdir = _Unzip(filepath)

	_Backup(unzipdir, patchdir)

	_Install(unzipdir, patchdir)
	

	print
	print
	print "Complated Installation VS2012 Update 2 Korean Patch"
	print
	print "Support by http://blog.powerumc.kr"
	print



   