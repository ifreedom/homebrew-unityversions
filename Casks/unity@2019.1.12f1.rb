cask 'unity@2019.1.12f1' do
  version '2019.1.12f1,f04f5427219e'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/f04f5427219e/MacEditorInstaller/Unity.pkg"
  name 'Unity 2019.1.12f1'
  homepage 'https://unity3d.com/unity/'

  pkg 'Unity.pkg'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2019.1.12f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2019.1.12f1'
end
