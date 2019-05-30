cask 'unity-windows-support-for-editor@2017.4.23f1' do
  version '2017.4.23f1,f80c8a98b1b5'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/f80c8a98b1b5/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-2017.4.23f1.pkg"
  name 'Windows Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Windows-Support-for-Editor-2017.4.23f1.pkg'

  depends_on cask: 'unity@2017.4.23f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.4.23f1"
      FileUtils.move "/Applications/Unity-2017.4.23f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.4.23f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.4.23f1/PlaybackEngines/WindowsStandaloneSupport'
end
