cluwne-transform = { CAPITALIZE($target) } превратился в клувна!
cluwne-name-prefix = клувнированн{ GENDER($target) ->
        [male] ый
        [female] ая
        [epicene] ое
       *[neuter] ые
    } { $baseName }
