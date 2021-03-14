let
    // Conexão a fonte de dados.
    Source = Web.BrowserContents("https://github.com/okfn-brasil/censo-querido-diario/blob/main/CONTRIBUTING.md#para-ajudar-na-an%C3%A1lise-e-na-produ%C3%A7%C3%A3o-dos-relat%C3%B3rios"),
    // Tabela extraída da página.
    #"Extracted Table From Html" = Html.Table(Source, {{"Column1", "TABLE > * > TR > :nth-child(1)"}, {"Column2", "TABLE > * > TR > :nth-child(2)"}, {"Column3", "TABLE > * > TR > :nth-child(3)"}}, [RowSelector="TABLE > * > TR"]),
    // Primeira linha promovida como cabeçalho.
    #"Promoted Headers" = Table.PromoteHeaders(#"Extracted Table From Html", [PromoteAllScalars=true]),
    // Tipos de dados definidos.
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Escopo", type text}, {"Coleta", type text}, {"Análise", type text}})
in
    #"Changed Type"
