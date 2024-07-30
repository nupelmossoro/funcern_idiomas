# funcern_inscricao

Este é um aplicativo Rails 7.

## Documentação

Este README descreve o propósito deste repositório e como configurar um ambiente de desenvolvimento.


## Pré-requisitos

Este projeto requer:

* Ruby 3.2.2, preferencialmente gerenciado usando [rvm](https://rvm.io/rvm/install)
* O PostgreSQL deve estar instalado e aceitando conexões


Se precisar de ajuda para configurar um ambiente de desenvolvimento Ruby, confira este [Guia de configuração do Rails](https://github.com/isaahmdantas/start-softmedical/blob/main/INSTALAR_RAILS.md).


## Primeiros passos

* bundle exec bin/setup
* rails s 

Acesse o aplicativo em <http://localhost:3000/>.

### Mandeira rápida de gerar um crud: 

```bash 
rails g scaffold Post title:string description:text active:boolean deleted_at:datetime:index 
```
> Sempre ao gerar o crud adicionar o atributo `deleted_at:datetime:index`

### Como gerar o datatable da classe 
```bash 
rails generate datatable Posts
``` 

### Como gerar o arquivo de tradução da classe

* Lembre-se: Ainda será necessário traduzir os atributos gramaticalmente.

```bash 
rails generate tradutor Post
``` 


## Documentação do template 

* [softmedical-hero](https://github.com/heronildesjr/softmedical-hero/blob/master/dist/docs.html)