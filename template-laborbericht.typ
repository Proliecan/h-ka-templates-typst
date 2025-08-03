#let laborbericht(
  degree: "",
  program: "",
  title: "",
  subtitle: "",
  author: "",
  matriculation-number: "",
  submission-date: "",
  font: "New Computer Modern",
  dates: (),
  sources:"",
  content,
) = [
  #set document(title: title, author: author)

  #set page(
    paper: "a4",
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    footer: "",
  )

  #set text(
    font: font,
    size: 12pt,
    lang: "de",
  )
  #set par(leading: 1em)

  #grid(
    align: (left + horizon, right + horizon),
    columns: (1fr, 1fr),
    image("HKALogo.png", height: 2cm), image("HKA_EIT_Bildmarke-h_CMYK_klein.png", height: 1cm),
  )

  #v(5mm)
  #align(center, text(font: font, 1.9em, weight: 700, "Hochschule Karlsruhe"))

  #v(15mm)

  #align(center, text(font: font, 1.5em, weight: 100, degree + " " + program))

  #v(1fr)

  #align(center, text(font: font, 1.2em, weight: 700, title))
  #align(center, text(font: font, 1.2em, weight: 500, subtitle))

  #v(1fr)

  #pad(top: 3em, right: 10%, left: 10%, grid(
    columns: (3fr, 3fr),
    gutter: 1em,
    ..dates.flatten()
  ))

  #pagebreak()

  #set page(
    footer: auto,
    numbering: "I",
    number-align: center,
  )
  #counter(page).update(1)

  #heading(
    [Hinweis zu Warenzeichen und Markennamen],
    outlined: false,
  )
  Diese Arbeit enthält Nennungen von Unternehmensmarken, Produkten und Dienstleistungen. Diese Nennungen stellen keine Markenzeichenbenutzung im geschäftlichen Verkehr dar und dienen lediglich einem wissenschaftlichen Zweck. Aus Gründen der besseren Lesbarkeit wird somit auf die Kennzeichnung dieser Marken mit den entsprechenden Markensymbolen verzichtet.

  #v(1fr)

  #heading([Gleichstellungshinweis], outlined: false)
  Zur besseren Lesbarkeit wird auf geschlechtsspezifische Doppelnennungen verzichtet. Stattdessen werden geschlechtsbezogene Personennennungen ganz vermieden und falls nicht anders möglich nach Hermes Phettberg ins Neutrum überführt.
  (T. Kronschläger, Entgendern Nach Phettberg Im Überblick, 2020)

  #pagebreak()

  #outline() <outline>

  #pagebreak()

  #set page(numbering: "1")
  #counter(page).update(1)
  #set heading(numbering: "1.")
  #set math.equation(numbering: "(1)")

  #content

  #pagebreak()

  #context counter(page).update(counter(page).at(<outline>))
  #counter(page).step()
  #set page(numbering: "I")

  #outline(
    title: heading("Abbildungsverzeichnis", outlined: true),
    target: figure.where(kind: image),
  )

  #bibliography(sources, style: "ieee")
]
