using LemuRivolta.InkAtoms;

using UnityEngine;


[System.Serializable]
public class InkStoryException : System.Exception
{
    public InkStoryException() { }
    public InkStoryException(string message) : base(message) { }
    public InkStoryException(string message, System.Exception inner) : base(message, inner) { }
    protected InkStoryException(
      System.Runtime.Serialization.SerializationInfo info,
      System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
}

[CreateAssetMenu(menuName = "The Good Dog Show/Create Throw Exception External Function")]
public class ThrowExceptionExternalFunction : ActionExternalFunction
{
    ThrowExceptionExternalFunction() : base("throwException") { }

    public override void Call(ExternalFunctionContext context) =>
        throw new InkStoryException((string)context.Arguments[0]);
}
