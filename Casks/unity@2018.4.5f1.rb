cask 'unity@2018.4.5f1' do
  version '2018.4.5f1,7b38f8ac282e'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/7b38f8ac282e/MacEditorInstaller/Unity.pkg"
  name 'Unity 2018.4.5f1'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.4.5f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.4.5f1'
end
