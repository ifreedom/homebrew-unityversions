cask 'unity-webgl-support-for-editor@5.6.4f1' do
  version '5.6.4f1,ac7086b8d112'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/ac7086b8d112/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-5.6.4f1.pkg"
  name 'WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-WebGL-Support-for-Editor-5.6.4f1.pkg'

  depends_on cask: 'unity@5.6.4f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-5.6.4f1"
      FileUtils.move "/Applications/Unity-5.6.4f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-5.6.4f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-5.6.4f1/PlaybackEngines/WebGLSupport'
end
