/*
 * Copyright (c) 2020 AoiKamishiro/神城葵
 * 
 * This code is provided under the MIT license.
 * 
 * This program uses the following code, which is provided under the MIT License.
 * https://download.unity3d.com/download_unity/008688490035/builtin_shaders-2018.4.20f1.zip?_ga=2.171325672.957521966.1599549120-262519615.1592172043
 * https://github.com/synqark/Arktoon-Shaders
 * 
 */

using UnityEditor;
using UnityEngine;
namespace Kamishiro.UnityShader.MultiTexturePoster
{
    public class UnlitGUI : ShaderGUI
    {
        private Mode shaderMode = Mode.Simple;
        private enum Mode
        {
            Simple,
            XFade,
            Slide
        }
        private MaterialEditor m_MaterialEditor;
        #region Matdrial Property
        private MaterialProperty dispTime;
        private MaterialProperty fadeTime;
        private MaterialProperty singleTime;
        private MaterialProperty cycleTime;
        private MaterialProperty direction;
        private MaterialProperty count;
        private MaterialProperty mainTex;
        private MaterialProperty cull;
        private MaterialProperty tex1;
        private MaterialProperty tex2;
        private MaterialProperty tex3;
        private MaterialProperty tex4;
        private MaterialProperty tex5;
        private MaterialProperty tex6;
        private MaterialProperty tex7;
        private MaterialProperty tex8;
        private MaterialProperty tex9;
        private MaterialProperty tex10;
        private MaterialProperty tex11;
        private MaterialProperty tex12;
        private MaterialProperty tex13;
        private MaterialProperty tex14;
        private MaterialProperty tex15;
        #endregion
        private void FindProperties(MaterialProperty[] props)
        {
            dispTime = FindProperty("_DispTime", props);
            fadeTime = FindProperty("_FadeTime", props);
            count = FindProperty("_Count", props);
            direction = FindProperty("_Direction", props);
            singleTime = FindProperty("_SingleTime", props);
            cycleTime = FindProperty("_CycleTime", props);
            cull = FindProperty("_Cull", props);
            mainTex = FindProperty("_MainTex", props);
            tex1 = FindProperty("_Tex1", props);
            tex2 = FindProperty("_Tex2", props);
            tex3 = FindProperty("_Tex3", props);
            tex4 = FindProperty("_Tex4", props);
            tex5 = FindProperty("_Tex5", props);
            tex6 = FindProperty("_Tex6", props);
            tex7 = FindProperty("_Tex7", props);
            tex8 = FindProperty("_Tex8", props);
            tex9 = FindProperty("_Tex9", props);
            tex10 = FindProperty("_Tex10", props);
            tex11 = FindProperty("_Tex11", props);
            tex12 = FindProperty("_Tex12", props);
            tex13 = FindProperty("_Tex13", props);
            tex14 = FindProperty("_Tex14", props);
            tex15 = FindProperty("_Tex15", props);
        }
        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {
            FindProperties(properties);
            m_MaterialEditor = materialEditor;
            Material material = materialEditor.target as Material;
            ShaderPropertiesGUI(material);
        }
        private void ShaderPropertiesGUI(Material material)
        {
            EditorGUI.BeginChangeCheck();
            {
                ModeCheck(material);
                UIHelper.ShurikenHeader("Main");
                m_MaterialEditor.FloatProperty(dispTime, dispTime.displayName);
                if (shaderMode == Mode.XFade || shaderMode == Mode.Slide)
                {
                    m_MaterialEditor.ShaderProperty(fadeTime, fadeTime.displayName);
                }
                m_MaterialEditor.ShaderProperty(count, count.displayName);
                if (shaderMode == Mode.Slide)
                {
                    m_MaterialEditor.ShaderProperty(direction, direction.displayName);
                }
                EditorGUILayout.Space();
                EditorGUILayout.LabelField("Textures", EditorStyles.boldLabel);
                DoTextures();
                EditorGUILayout.Space();
                EditorGUILayout.Space();
                EditorGUILayout.LabelField("Rendering Option", EditorStyles.boldLabel);

                m_MaterialEditor.ShaderProperty(cull, cull.displayName);
                m_MaterialEditor.RenderQueueField();
            }
            if (EditorGUI.EndChangeCheck())
            {
                CheckCount();
            }
            TransitionSetting();
            UIHelper.ShurikenHeader(Styles.nameMultiTexturePosterUnlit);
            EditorGUILayout.LabelField(Styles.author);
            Manager.DisplayVersion();
            EditorGUILayout.Space();
            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button(Styles.btnReadme)) { UIHelper.OpenLink(Styles.linkReadme); }
            if (GUILayout.Button(Styles.btnDescription)) { UIHelper.OpenLink(Styles.linkDescription); }
            EditorGUILayout.EndHorizontal();
        }
        private void DoTextures()
        {
            EditorGUI.indentLevel++;
            int num = (int)count.floatValue;
            m_MaterialEditor.TexturePropertySingleLine(new GUIContent(mainTex.displayName), mainTex);
            if (num >= 2)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex1.displayName), tex1);
            if (num >= 3)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex2.displayName), tex2);
            if (num >= 4)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex3.displayName), tex3);
            if (num >= 5)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex4.displayName), tex4);
            if (num >= 6)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex5.displayName), tex5);
            if (num >= 7)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex6.displayName), tex6);
            if (num >= 8)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex7.displayName), tex7);
            if (num >= 9)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex8.displayName), tex8);
            if (num >= 10)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex9.displayName), tex9);
            if (num >= 11)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex10.displayName), tex10);
            if (num >= 12)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex11.displayName), tex11);
            if (num >= 13)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex12.displayName), tex12);
            if (num >= 14)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex13.displayName), tex13);
            if (num >= 15)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex14.displayName), tex14);
            if (num >= 16)
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(tex15.displayName), tex15);

            EditorGUI.indentLevel--;
        }
        private void CheckCount()
        {
            int num = (int)count.floatValue;
            if (num < 1)
            {
                count.floatValue = (float)1;
            }
            else if (16 < num)
            {
                count.floatValue = (float)16;
            }
        }
        private void ModeCheck(Material material)
        {
            if (material.shader.name == Styles.SimpleUnlitShader)
            {
                shaderMode = Mode.Simple;
            }
            else if (material.shader.name == Styles.XFadeUnlitShader)
            {
                shaderMode = Mode.XFade;
            }
            else if (material.shader.name == Styles.SlideUnlitShader)
            {
                shaderMode = Mode.Slide;
            }
        }
        private void TransitionSetting()
        {
            if (shaderMode == Mode.XFade || shaderMode == Mode.Slide)
            {
                singleTime.floatValue = dispTime.floatValue + fadeTime.floatValue;
            }
            else
            {
                singleTime.floatValue = dispTime.floatValue;
            }
            cycleTime.floatValue = singleTime.floatValue * count.floatValue;
        }
    }
}