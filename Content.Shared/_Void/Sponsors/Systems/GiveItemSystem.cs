namespace Content.Shared._Void.Sponsors.Systems
{
    public sealed class SponsorsSystem : EntitySystem
    {
        // Словарь, где ключ - это ник игрока, а значение - массив с прототипами предметов.
        private readonly Dictionary<string, string[]> _playerItems = new()
        {
            // Запись создана для теста, чтобы делать по примеру для других
            {"Makot", new[] {"NuclearGrenadeFake"}},
            {"NEON987", new[] {"NuclearGrenadeFake"}},
            {"TwiceNoRise", new[] {"NuclearGrenadeFake"}},
            {"Malanisa", new[] {"NuclearGrenadeFake"}},
        };

        /// <summary>
        /// Получаем список прототипов, которые нужно выдать игроку по его нику.
        /// </summary>
        /// <param name="playerName">Ник игрока</param>
        /// <returns>Массив строк с ID прототипов</returns>
        public string[] GetItemsForPlayer(string playerName)
        {
            if (_playerItems.TryGetValue(playerName, out var items))
            {
                return items;
            }

            // Если игрок не найден в словаре, возвращаем пустой массив
            return new string[0];
        }
    }
}
