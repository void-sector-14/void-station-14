// ReSharper disable ArrangeTrailingCommaInMultilineLists
namespace Content.Server.Entry
{
    public static class IgnoredComponents
    {
        public static string[] List => new[] {
            "ConstructionGhost",
            "IconSmooth",
            "InteractionOutline",
            "Marker",
            "GuidebookControlsTest",
            "GuideHelp",
            "Clickable",
            "Icon",
            "HandheldGPS",
            "CableVisualizer",
            "SolutionItemStatus",
            "UIFragment",
            "PdaBorderColor",
            "InventorySlots",
            "LightFade",
            "HolidayRsiSwap",
            "OptionsVisualizer",
            // По идее, данный компонент нужно исключать из списка доступных на ручное добавление (админка).
            // Но по непонятной причине, система начинает ругаться:
            // > [FATL] unhandled: System.InvalidOperationException: Cannot add Carriable to ignored components: It is already registered as a component
            // Потому закомментировано до тех пор, пока кто-то не разберётся в причинах ошибки и не избавится от неё.
            // "Carriable"
        };
    }
}
