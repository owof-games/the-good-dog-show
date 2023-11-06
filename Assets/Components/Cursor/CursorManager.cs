using UnityEngine;

public class CursorManager : MonoBehaviour
{
    [SerializeField] private Texture2D cursor;
    [SerializeField] private Vector2 hotspot;

    private void Awake()
    {
        Cursor.SetCursor(cursor, hotspot, CursorMode.ForceSoftware);
    }
}
