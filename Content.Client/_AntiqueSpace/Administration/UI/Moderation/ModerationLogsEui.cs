using Content.Client.Eui;
using Content.Shared.Administration.Logs;
using Content.Shared.Eui;
using JetBrains.Annotations;
using Robust.Client.Graphics;
using Robust.Client.UserInterface;
using Robust.Client.UserInterface.CustomControls;
using System.Linq;
using System.Numerics;
using static Content.Shared.Administration.Logs.AdminLogsEuiMsg;

namespace Content.Client._AntiqueSpace.Administration.UI.Moderation;

[UsedImplicitly]
public sealed class ModerationLogsEui : BaseEui
{
    public ModerationLogsEui()
    {
        ModerationLogsWindow = new DefaultWindow()
        {
            TitleClass = "windowTitle",
            HeaderClass = "windowHeader",
            SetSize = new Vector2(1000, 400),
            Title = Loc.GetString("moderation-logs-window"),
            MinSize = new Vector2(400, 200)
        };
        ModerationLogsWindow.OnClose += OnCloseWindow;
        ModerationLogsControl = new ModerationLogsControl(ModerationLogsWindow);
        ModerationLogsWindow.Contents.AddChild(ModerationLogsControl);
        RequestLogs();

        ModerationLogsControl.RoundSpinBox.ValueChanged += _ => RequestLogs();
        ModerationLogsControl.LogSearch.OnTextEntered += _ => RequestLogs();
        ModerationLogsControl.RefreshButton.OnPressed += _ => RequestLogs();
        ModerationLogsControl.NextButton.OnPressed += _ => NextLogs();
    }

    private DefaultWindow? ModerationLogsWindow { get; set; }
    private ModerationLogsControl ModerationLogsControl { get; }
    private bool FirstState { get; set; } = true;

    public void OnRequestClosed(WindowRequestClosedEventArgs args)
    {
        SendMessage(new CloseEuiMessage());
    }

    public void RequestLogs()
    {
        var request = new LogsRequest(
            ModerationLogsControl.SelectedRoundId,
            null,
            null,
            null,
            null,
            null,
            ModerationLogsControl.SelectedPlayers.Count != 0,
            ModerationLogsControl.SelectedPlayers.ToArray(),
            null,
            false,
            DateOrder.Descending);

        SendMessage(request);
    }

    private void NextLogs()
    {
        ModerationLogsControl.NextButton.Disabled = true;
        var request = new NextLogsRequest();
        SendMessage(request);
    }

    private void OnCloseWindow()
    {
        SendMessage(new CloseEuiMessage());
    }

    public override void HandleState(EuiStateBase state)
    {
        var s = (AdminLogsEuiState)state;

        if (s.IsLoading)
            return;

        ModerationLogsControl.SetCurrentRound(s.RoundId);
        ModerationLogsControl.SetPlayers(s.Players);
        ModerationLogsControl.UpdateCount(round: s.RoundLogs);

        if (!FirstState)
            return;

        FirstState = false;
        // В этом методе так же вызывается реквест логов. Поэтому дублирование удаляем. (Вызывается он из - за установки текущего раунда в spidBox, что тоже вызывает реквест логов)
        ModerationLogsControl.SetRoundSpinBox(s.RoundId);
    }

    public override void HandleMessage(EuiMessageBase msg)
    {
        base.HandleMessage(msg);

        switch (msg)
        {
            case NewLogs newLogs:
                if (newLogs.Replace)
                    ModerationLogsControl.SetLogs(newLogs.Logs);
                else
                    ModerationLogsControl.AddLogs(newLogs.Logs);

                ModerationLogsControl.NextButton.Disabled = !newLogs.HasNext;
                break;

            case SetLogFilter setLogFilter:
                if (setLogFilter.Search != null)
                    ModerationLogsControl.LogSearch.SetText(setLogFilter.Search);

                break;
        }
    }

    public override void Opened()
    {
        base.Opened();

        ModerationLogsWindow?.OpenCentered();
    }

    public override void Closed()
    {
        base.Closed();

        ModerationLogsControl.Dispose();
        ModerationLogsWindow?.Dispose();
    }
}
