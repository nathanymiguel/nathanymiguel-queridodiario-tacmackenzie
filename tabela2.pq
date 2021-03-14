let
    // Conexão a fonte de dados.
    Source = Csv.Document(Web.Contents("https://docs.google.com/spreadsheets/d/e/2PACX-1vSYTNTDWRGct_jw_3BFAPMNgh6MqyIq5SqP_BlUFQ85c41xzxfO81eDDOmDTFUrjum6YADf1htIHABh/pub?gid=373864113&single=true&output=csv"),[Delimiter=",", Columns=7, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    // Primeira linha promovida como cabeçalho.
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    // Tipos de dados definidos.
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"nome_variavel", type text}, {"descricao", type text}, {"tipo_dado", type text}, {"tamanho", type text}, {"tipo_variavel", type text}, {"tipo_mensuaracao", type text}, {"valores_possiveis", type text}}),
    // Remoção de colunas não necessárias para análise, "fonte_4" não tem valores, "validacao" somente tem valores TRUE, "navegacao" não tem uso na análise.
    #"Filtered Rows" = Table.SelectRows(#"Changed Type", each ([nome_variavel] <> "fonte_4" and [nome_variavel] <> "navegacao" and [nome_variavel] <> "validacao"))
in
    #"Filtered Rows"
