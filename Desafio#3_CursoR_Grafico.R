
# Desafio #3 -------------------------------------------------------------------------------------------------------------------------------
# Gráfico Temático Star Wars ---------------------------------------------------------------------------------------------------------------
# Curso R ----------------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 16/04/2022 -------------------------------------------------------------------------------------------------------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(tidyverse) # Pacotes ggplot2 para o gráfico e dplyr para filtrar os dados.
library(cowplot) # Pacote para inserir imagem ao gráfico.
library(dados) # Pacote para acessar os dados.
library(showtext) # Pacote para baixar fonte das letras.

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dados_starwars
View(dados_starwars)

# Selecionar e filtrar dados ---------------------------------------------------------------------------------------------------------------

## Identificando o outlier da massa

dados_starwars %>%
  select(nome, altura, massa) %>%
  summarise(outlier = max(massa, na.rm = TRUE))

## Excluindo o outlier

dados_starwars %>%
  select(nome, altura, massa) %>%
  filter(massa != 1358)
  
## Para saber a localização do ponto da altura e massa do Darth Vader

point_vader <- dados %>%
  filter(nome == "Darth Vader")
point_vader

# Adicionando a fonte ----------------------------------------------------------------------------------------------------------------------

font_paths() # Verificando caminho da fonte
font <- font_files() 
view(font) # Fontes disponíveis
font_add("Star Jedi", "Starjedi.ttf")
font_families()

# Gráfico ----------------------------------------------------------------------------------------------------------------------------------

plot <- ggplot(dados_starwars) +
  geom_point(aes(x = massa, y = altura), color = "yellow", shape = 18, size = 3) +
  theme(
    plot.title = element_text(hjust = 0.5, color = "yellow", family = "Star Jedi"),
    plot.subtitle = element_text(hjust = 0.5, color = "yellow", family = "Star Jedi"),
    axis.title = element_text(color = "yellow", family = "Star Jedi"),
    axis.text = element_text(color = "yellow", family = "Star Jedi"),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "gray5"),
    panel.grid.minor.y = element_line(color = "gray9"),
    panel.background = element_rect(fill = "transparent"),
    plot.background = element_rect(fill = "transparent")) +
    annotate(geom = "point", x = 136, y = 202, 
             color = "red", size = 3, shape = 18) +
    annotate(geom = "label", x = 126, y = 209, label = "Darth Vader", hjust = "left",
             fill = "red", color = "black", family = "Star Jedi") +
    scale_x_continuous(limits =  c(0, 200)) +
    labs(x = "MASSA", y = "ALTURA", title = "STAR WARS", subtitle = "WAY THE FORCE BE WITH YOU") 
plot

ggdraw() +
draw_image(halign = 1, valign = 1, width = 1, height = 1, scale = 1.1,
           image = "11836.jpg") +
  draw_plot(plot)



 
