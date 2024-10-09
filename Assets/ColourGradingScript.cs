using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColourGradingScript : MonoBehaviour
{
    public Material m_renderMaterial;
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, m_renderMaterial);
    }
}
