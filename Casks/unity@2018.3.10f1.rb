cask 'unity@2018.3.10f1' do
  version '2018.3.10f1,f88de2c96e63'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/f88de2c96e63/MacEditorInstaller/Unity.pkg"
  name 'Unity 2018.3.10f1'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.3.10f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.3.10f1'
end
