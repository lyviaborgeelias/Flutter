# Projetos Flutter

Repositório de estudos e projetos desenvolvidos com Flutter e Dart. Aqui estão reunidos exercícios de interface, navegação, gerenciamento de estado, persistência local e construção de layouts responsivos.

## Projetos

| Projeto | Descrição |
| --- | --- |
| [`Aula1`](./Aula1) | Exercícios introdutórios com `Column`, `Row`, `Stack`, composição de widgets, navegação entre telas, imagens e fontes personalizadas. |
| [`contador_app`](./contador_app) | Aplicativo de contador para praticar widgets com estado e atualização da interface. |
| [`netflix_app`](./netflix_app) | Aplicativo inspirado na Netflix, com login, catálogo, detalhes de filmes, cadastro de novos títulos e persistência local usando `shared_preferences`. |
| [`portifolio`](./portifolio) | Portfólio pessoal com apresentação, feed de projetos, navegação, imagens e identidade visual personalizada. |

## Tecnologias

- Flutter
- Dart
- Material Design
- Google Fonts
- Shared Preferences

## Pré-requisitos

Antes de começar, instale o [Flutter](https://docs.flutter.dev/get-started/install) e confirme a configuração do ambiente:

```bash
flutter doctor
```

## Como executar

Clone o repositório:

```bash
git clone https://github.com/lyviaborgeelias/Flutter.git
cd Flutter
```

Entre na pasta do projeto desejado, instale as dependências e execute o aplicativo. Exemplo com o portfólio:

```bash
cd portifolio
flutter pub get
flutter run
```

Para executar outro projeto, substitua `portifolio` por `Aula1`, `contador_app` ou `netflix_app`.

## Verificações

Dentro da pasta de cada projeto, você pode analisar o código e executar os testes com:

```bash
flutter analyze
flutter test
```

## Estrutura do repositório

```text
Flutter/
├── Aula1/
├── contador_app/
├── netflix_app/
└── portifolio/
```

## Autora

Desenvolvido por [Lyvia Borges Elias](https://github.com/lyviaborgeelias).
