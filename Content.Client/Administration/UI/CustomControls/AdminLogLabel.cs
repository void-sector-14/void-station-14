using Content.Client._AntiqueSpace.UserInterface;
using Content.Shared.Administration.Logs;
using Content.Shared.Database;
using Robust.Client.UserInterface;
using Robust.Client.UserInterface.Controls;

namespace Content.Client.Administration.UI.CustomControls;

public sealed class AdminLogLabel : RichTextLabel
{
    private LogsList _logsList = new();
    public AdminLogLabel(ref SharedAdminLog log, HSeparator separator)
    {
        Log = log;
        Separator = separator;

        foreach (var (group, list) in _logsList.TypesDictionary)
        {
            if (list.Contains(log.Type))
                SetMessage($"[{Loc.GetString(group)}|{log.Impact}|{log.Date:HH:mm:ss}]\n{log.Message}");
        }

        OnVisibilityChanged += VisibilityChanged;
    }
    public SharedAdminLog Log { get; }

    public HSeparator Separator { get; }

    private void VisibilityChanged(Control control)
    {
        Separator.Visible = Visible;
    }

    protected override void Dispose(bool disposing)
    {
        base.Dispose(disposing);

        OnVisibilityChanged -= VisibilityChanged;
    }
}
