let
    // Conexão a fonte de dados.
    Source = Csv.Document(Web.Contents("https://docs.google.com/spreadsheets/d/e/2PACX-1vSYTNTDWRGct_jw_3BFAPMNgh6MqyIq5SqP_BlUFQ85c41xzxfO81eDDOmDTFUrjum6YADf1htIHABh/pub?output=csv"),[Delimiter=",", Columns=7, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    // Primeira linha promovida como cabeçalho.
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    // Tipos de dados definidos.
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"nome_variavel", type text}, {"descricao", type text}, {"tipo_dado", type text}, {"tamanho", type text}, {"tipo_variavel", type text}, {"tipo_mensuaracao", type text}, {"valores_possiveis", type text}})
in
    #"Changed Type1"
