let
    // Conexão a fonte de dados.
    Source = Csv.Document(Web.Contents("https://docs.google.com/spreadsheets/d/e/2PACX-1vRGRJ4gp3bacfoBmHm83_o_hXRnkBAY7mRg8DNr5Khfkr3e8p1UR7-z31ZtW_Z2qI3wc6wPHDatYpTe/pub?gid=1136195654&single=true&output=csv"),[Delimiter=",", Columns=17, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    // Primeira linha promovida como cabeçalho.
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    // Tipos de dados definidos.
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"municipio", type text}, {"IBGE", Int64.Type}, {"IBGE7", Int64.Type}, {"UF", type text}, {"regiao", type text}, {"populacao_2020", Int64.Type}, {"eh_capital", type logical}, {"fonte_1", type text}, {"fonte_2", type text}, {"fonte_3", type text}, {"fonte_4", type text}, {"is_online", Int64.Type}, {"data_inicial", type text}, {"tipo_arquivo", type text}, {"validacao", type logical}, {"navegacao", type text}, {"observacoes", type text}}),
    // Retirado a UF do nome do municipio, uma vez que já tem a coluna de UF na tabela.
    #"Extracted Text Before Delimiter" = Table.TransformColumns(#"Changed Type", {{"municipio", each Text.BeforeDelimiter(_, " ("), type text}}),
    // Remoção de colunas não necessárias para análise, "fonte_4" não tem valores, "validacao" somente tem valores TRUE, "navegacao" não tem uso na análise.
    #"Removed Columns" = Table.RemoveColumns(#"Extracted Text Before Delimiter",{"fonte_4", "validacao", "navegacao"})
in
    #"Removed Columns"
