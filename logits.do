clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao.csv", encoding(utf8)

set matsize 10000

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin i.juiz_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", replace ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)


*-------------------------------------------------------------------------*
*------------------ Dados de crimes gerados manualmente ------------------*
*-------------------------------------------------------------------------*
clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao_2.csv", encoding(utf8)

set matsize 10000
set maxiter 25
set seed 1102094842

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin tráfico_de_drogas_e_condutas_afi furto_qualificado furto lesão_corporal crimes_de_trânsito crimes_do_sistema_nacional_de_ar decorrente_de_violência_doméstic crimes_de_tráfico_ilícito_e_uso_ receptação homicídio_simples homicídio_qualificado estelionato roubo crimes_falimentares ameaça crimes_de_concorrência_desleal injúria dano roubo_majorado apropriação_indébita atentado_violento_ao_pudor posse_de_drogas_para_consumo_pes calúnia crimes_contra_as_relações_de_con crimes_contra_o_meio_ambiente_e_ corrupção_ativa desacato crimes_contra_a_honra representação_caluniosa constrangimento_ilegal crimes_contra_a_liberdade_pessoa desobediência difamação crimes_de_abuso_de_autoridade esbulho_possessório falsificação_de_documento_públic falsidade_ideológica parcelamento_do_solo_urbano latrocínio uso_de_documento_falso extorsão advocacia_administrativa crimes_contra_a_ordem_econômica_ crimes_contra_a_ordem_econômica estelionato_majorado crime_de_sonegação_fiscal_l_4729 crimes_contra_as_marcas seqüestro_e_cárcere_privado duplicata_simulada associação_para_a_produção_e_trá adulteração_de_sinal_identificad falsa_identidade receptação_qualificada oferecimento_de_drogas_para_cons fraude_à_execução crimes_contra_a_ordem_tributária furto_privilegiado dano_qualificado introdução_ou_abandono_de_animai da_poluição crimes_de_lavagem_ou_ocultação_d resistência crimes_de_tortura falsificação_de_papéis_públicos peculato falsificação_de_documento_partic apropriação_de_coisa_achada incitação_ao_crime crimes_contra_a_propriedade_inte falsidade_material_de_atestado_o crimes_da_lei_de_licitações fraude_para_recebimento_de_inden certidão_ou_atestado_ideologicam supressão_de_documento extorsão_mediante_seqüestro aborto_qualificado furto_de_coisa_comum contratação_de_operação_de_crédi seguida_de_morte crimes_resultante_de_preconceito feminicídio corrupção_passiva falsidade_de_atestado_médico alteração_de_limites favorecimento_da_prostituição inserção_de_dados_falsos_em_sist extravio_sonegação_ou_inutilizaç apropriação_de_coisa_havida_por_ violência_arbitrária crime_de_improbidade_administrat crimes_contra_a_propriedade_indu concussão prevaricação redução_a_condição_análoga_à_de_ sonegação_de_contribuição_previd crime_contra_a_administração_da_ extorsão_mediante_restrição_da_l aborto_provocado_pela_gestante_o apologia_de_crime_ou_criminoso recusa_retardamento_ou_omissão_d fabricação_de_objeto_destinado_a aborto abuso_de_incapazes jogo_de_azar assunção_de_obrigação_no_último_ colaboração_com_grupo_organizaçã subtração_ou_inutilização_de_liv fraude_no_comércio emprego_irregular_de_verbas_ou_r crimes_contra_o_ordenamento_urba crimes_contra_as_finanças_públic excesso_de_exação apropriação_indébita_previdenciá usurpação_de_função_pública condescendência_criminosa induzimento_instigação_ou_auxíli exercício_funcional_ilegalmente_ financiamento_ou_custeio_de_prod furto_de_veículo_automotor_a_ser modificação_ou_alteração_não_aut infanticídio falsificação_do_selo_ou_sinal_pú extorsão_mediante_sequestro_segu alienação_ou_oneração_fraudulent crimes_contra_indicações_geeográ possuir_cena_de_sexo_explícito_o crimes_do_código_brasileiro_de_t crimes_contra_patente_de_invençã corromper_ou_facilitar_a_corrupç abandono_de_função indução_instigação_ou_auxílio_ao fraude_na_entrega_de_coisa homicídio_privilegiado fraude_no_pagamento_por_meio_de_ disposição_de_coisa_alheia_como_ supressão_ou_alteração_de_marca_ extorsão_mediante_seqüestro_segu tráfico_de_influência prescrição_culposa_de_drogas violação_do_sigilo_funcional omissão_de_cautela_na_guarda_ou_ dano_em_coisa_de_valor_artístico petrechos_de_falsificação_de_pap vender_ingressos_de_evento_espor crime_de_descumprimento_de_medid assediar_criança_com_o_fim_de_co contrabando inutilização_de_edital_ou_de_sin crimes_contra_as_telecomunicaçõe perturbação_da_tranquilidade ordenação_de_despesa_não_autoriz moeda_falsa__assimilados perturbação_do_trabalho_ou_do_so jogo_do_bicho imputação_falsa_de_prática_de_in importunação_sexual induzimento_à_especulação promoção_constituição_financiame promover_tumulto_artigo_41b_1ª_p fraude_de_lei_sobre_estrangeiros posse_sexual_mediante_fraude peculato_mediante_erro_de_outrem descumprimento_de_determinação_d aborto_provocado_por_terceiro porte_de_arma_branca falso_reconhecimento_de_firma_ou crimes_contra_portadores_de_defi veicular_cenas_de_sexo_explícito divulgação_de_cena_de_estupro_se defraudação_de_penhor impedimento_perturbação_ou_fraud loteria_não_autorizada alteração_de_local_especialmente petrechos_para_falsificação_de_m i.juiz_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append ctitle(Logit_2) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)

*-------------------------------------------------------------------------*
*--------------------------   Dados Com DEAM   ---------------------------*
*-------------------------------------------------------------------------*

clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao_final.csv", encoding(utf8)

set matsize 10000

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

logit resultado_bin i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)


*-------------------------------------------------------------------------*
*-----------------------   Mlogit Dados Com DEAM   -----------------------*
*-------------------------------------------------------------------------*

clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao_final.csv", encoding(utf8)

set matsize 10000
set seed 1102094842

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

mlogit resultado_parcial_base i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\mlogit_marg.xls", replace ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

mlogit resultado_parcial_base i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\mlogit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

mlogit resultado_parcial_base i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\mlogit_marg.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

mlogit resultado_parcial_base i.ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\mlogit_marg.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)

*-------------------------------------------------------------------------*
*--------------------------    Trend de Ano    ---------------------------*
*-------------------------------------------------------------------------*

clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao_final.csv", encoding(utf8)

set matsize 10000
set seed 11020948

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", replace ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)

*-------------------------------------------------------------------------*
*-------------------    Trend de Ano e Severidade    ---------------------*
*-------------------------------------------------------------------------*

clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao_final.csv", encoding(utf8)

set matsize 10000
set seed 11020948

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero genero_severidade, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin deam deam_crime_genero me_too me_too_genero genero_severidade, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero genero_severidade, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin deam deam_crime_genero me_too me_too_genero genero_severidade, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\logit_marg_trend.xls", append  ctitle(Logit_1) keep(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero me_too me_too_genero genero_severidade) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)


*-------------------------------------------------------------------------*
*--------------------------     Robustness     ---------------------------*
*-------------------------------------------------------------------------*

clear
import delimited "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\base_regressao_final.csv", encoding(utf8)

set matsize 10000
set seed 11020948

encode magistrado, generate(juiz_bin)
encode comarca, generate(comarca_bin)
encode assunto, generate(assunto_bin)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin i.juiz_bin deam deam_crime_genero ano_genero  if me_too == 0, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\robustness.xls", replace ctitle(Logit_1) keep( i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.assunto_bin deam deam_crime_genero  ano_genero if me_too == 0, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\robustness.xls", append  ctitle(Logit_1) keep( i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) label addtext(Judge FE, NO ,Judicial District FE, YES , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.assunto_bin i.juiz_bin deam deam_crime_genero  ano_genero if me_too == 0, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\robustness.xls", append ctitle(Logit_1) keep( i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) label addtext(Judge FE, YES ,Judicial District FE, NO , Subject FE, YES, Year FE, YES)

logit resultado_bin ano i.crime_genero genero_juiz severidade i.juiz_crime_genero i.comarca_bin i.juiz_bin deam deam_crime_genero  ano_genero if me_too == 0, rob
margins, dydx(i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) post
outreg2 using "D:\OneDrive - Insper\LucianaYeung\Projeto_Genero\robustness.xls", append  ctitle(Logit_1) keep( i.crime_genero genero_juiz i.juiz_crime_genero severidade deam deam_crime_genero ano_genero) label addtext(Judge FE, YES ,Judicial District FE, YES , Subject FE, NO, Year FE, YES)
