cask 'unity-example@2017.4.32f1' do
  version '2017.4.32f1,4da3ed968770'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/4da3ed968770/MacExampleProjectInstaller/Examples.pkg"
  name 'Example Project'
  homepage 'https://unity3d.com/unity/'

  pkg 'Examples.pkg'

  depends_on cask: 'unity@2017.4.32f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.4.32f1"
      FileUtils.move "/Applications/Unity-2017.4.32f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.4.32f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Users/Shared/Unity'
end
