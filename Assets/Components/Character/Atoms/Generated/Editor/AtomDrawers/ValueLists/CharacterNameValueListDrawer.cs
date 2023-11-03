#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `CharacterName`. Inherits from `AtomDrawer&lt;CharacterNameValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(CharacterNameValueList))]
    public class CharacterNameValueListDrawer : AtomDrawer<CharacterNameValueList> { }
}
#endif
