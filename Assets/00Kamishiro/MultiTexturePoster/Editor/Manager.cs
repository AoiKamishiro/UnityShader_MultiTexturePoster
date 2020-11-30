/*
 * Copyright (c) 2020 AoiKamishiro
 * 
 * This code is provided under the MIT license.
 *
 * This program uses the following code, which is provided under the MIT License.
 * https://download.unity3d.com/download_unity/008688490035/builtin_shaders-2018.4.20f1.zip?_ga=2.171325672.957521966.1599549120-262519615.1592172043
 * https://github.com/synqark/Arktoon-Shaders
 * 
 */

using UnityEditor;
using UnityEditor.Callbacks;
using UnityEngine;
using UnityEngine.Networking;
namespace Kamishiro.UnityShader.MultiTexturePoster
{
    public class Manager : MonoBehaviour
    {
        public static int versionInt;
        private const string version = "v2.00";
        private const string configName = "aksmultitexposter";
        private const string url = "https://api.github.com/repos/AoiKamishiro/UnityShader_MultiTexturePoster/releases/latest";
        private static UnityWebRequest www;

        [DidReloadScripts(0)]
        private static void CheckVersion()
        {
            if (EditorApplication.isPlayingOrWillChangePlaymode) return;
            int.TryParse(version.Substring(1), out int verint);
            versionInt = verint * 100;
            // Check Local Version
            string localVersion = EditorUserSettings.GetConfigValue(configName + "_version_local") ?? "";

            if (!localVersion.Equals(version))
            {
                // Update Materiams
                //ArktoonMigrator.Migrate();
            }
            // Set Local Version
            EditorUserSettings.SetConfigValue(configName + "_version_local", version);
            // Get Remote Version
            www = UnityWebRequest.Get(url);

#if UNITY_2017_OR_NEWER
            www.SendWebRequest();
#else
#pragma warning disable 0618
            www.Send();
#pragma warning restore 0618
#endif

            EditorApplication.update += EditorUpdate;
            EditorUserSettings.SetConfigValue(configName + "_need_update", NeedUpdate().ToString());
        }


        private static void EditorUpdate()
        {
            while (!www.isDone) return;

#if UNITY_2017_OR_NEWER
                if (www.isNetworkError || www.isHttpError) {
                    Debug.Log(www.error);
                } else {
                    UpdateHandler(www.downloadHandler.text);
                }
#else
#pragma warning disable 0618
            if (www.isError)
            {
                Debug.Log(www.error);
            }
            else
            {
                UpdateHandler(www.downloadHandler.text);
            }
#pragma warning restore 0618
#endif

            EditorApplication.update -= EditorUpdate;
        }

        private static void UpdateHandler(string apiResult)
        {
            GitJson git = JsonUtility.FromJson<GitJson>(apiResult);
            string version = git.tag_name;
            EditorUserSettings.SetConfigValue(configName + "_version_remote", version);
        }

        private static bool NeedUpdate()
        {
            bool needUpdate = false;
            bool parseLocal = double.TryParse((EditorUserSettings.GetConfigValue(configName + "_version_local")).Substring(1), out double localVer);
            bool parseRemote = double.TryParse((EditorUserSettings.GetConfigValue(configName + "_version_remote")).Substring(1), out double remoteVer);
            if (parseLocal && parseRemote && (localVer < remoteVer))
            {
                needUpdate = true;
            }
            return needUpdate;
        }
        public static void DisplayVersion()
        {
            EditorGUILayout.LabelField(Styles.localVer + EditorUserSettings.GetConfigValue(configName + "_version_local"));
            EditorGUILayout.LabelField(Styles.remoteVer + EditorUserSettings.GetConfigValue(configName + "_version_remote"));
            if (bool.TryParse(EditorUserSettings.GetConfigValue(configName + "_need_update"), out bool needupdate) && needupdate)
            {
                //EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button(Styles.btnUpdate)) { UIHelper.OpenLink(Styles.linkRelease); }
                if (GUILayout.Button(Styles.btnBooth)) { UIHelper.OpenLink(Styles.linkBooth); }
                if (GUILayout.Button(Styles.btnVket)) { UIHelper.OpenLink(Styles.linkVket); }
                //EditorGUILayout.EndHorizontal();
            }
        }
        public class GitJson
        {
            public string tag_name;
        }


    }
}


