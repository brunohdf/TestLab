CS:BDD
======

É uma gem para criar a estrutura de um projeto calabash com suporte a Android e iOS.

Instalação
----------

	gem install cs-bdd


Criando projeto
---------------

	cs-bdd new <nome_do_projeto>

Por padrão o projeto é criado no idioma inglês, caso deseja criar em entrou idioma é preciso acrescentar o parâmetro **--lang=** especificado o idioma:

	cs-bdd new <nome_do_projeto> --lang=pt

Depois do projeto criado, ele terá a seguinte estrutura:

<div style="text-align:center" markdown="1">
    <img src="../images/csbdd.png"/>
</div>

## Generators

O cs-bdd possuiu nove gerados, para criar templates de Features, Step definitions e Screens. E todos gerados tem suporte a outros idiomas, é só adicionar o parâmetro **--lang=**.

Todos os comandos de generate devem ser executados no diretório raiz do projeto.

### Feature

	cs-bdd generate feature <nome_da_feature>

Android:

	cs-bdd generate aFeature <nome_feature_android>

iOS:

	cs-bdd generate iFeature <nome_feature_ios>
	
O generate feature por default já cria os arquivos de step definitions e screens.

<div style="text-align:center" markdown="1">
    <img src="../images/csbdd_create_feature.png"/>
</div>

### Setps

	cs-bdd generate step StepName

Android:
	
	cs-bdd generate aScreen <nome_step_android>

iOS:

	cs-bdd generate iScreen <nome_step_ios>
	

	