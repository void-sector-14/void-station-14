using Content.Client.Stylesheets;
using Robust.Client.UserInterface.Controls;

namespace Content.Client._AntiqueSpace.UserInterface.Buttons
{
    public sealed class PinTextureButton : TextureButton
    {
        public PinTextureButton(Guid id, bool isPinned)
        {
            Id = id;
            IsPinned = isPinned;
            ToggleMode = true;
        }

        public void SetupPin(PinTextureButton button)
        {
            UpdateTexture(button);
            button.OnPressed += PinButtonPressed(button);
        }

        private void UpdateTexture(PinTextureButton button)
        {
            if (button.IsPinned)
            {
                button.RemoveStyleClass(StyleNano.StyleClassPinButtonUnpinned);
                button.AddStyleClass(StyleNano.StyleClassPinButtonPinned);
            }
            else
            {
                button.RemoveStyleClass(StyleNano.StyleClassPinButtonPinned);
                button.AddStyleClass(StyleNano.StyleClassPinButtonUnpinned);
            }
        }

        private Action<ButtonEventArgs> PinButtonPressed(PinTextureButton button)
        {
            return args =>
            {
                button.IsPinned = !button.IsPinned;
                UpdateTexture(button);
                OnPinButtonStatusChanged?.Invoke(button);
            };
        }

        public Guid Id { get; set; }
        public bool IsPinned { get; set; }
        public event Action<PinTextureButton>? OnPinButtonStatusChanged;
    }
}
