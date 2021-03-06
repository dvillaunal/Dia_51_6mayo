__Protocolo:__

+ Daniel Felipe Villa Rengifo

+ Lenguaje: R

+ Tema: Manejo de Data Frames en R 

+ Fuentes:
  
  1. [TutorialsPoint](https://www.tutorialspoint.com/r/r_data_frames.htm)
  
  2. [Statistics Globe](https://statisticsglobe.com/sort-data-frame-in-r-example)


# ¿Que es un Data Frames?

Un Data Frame es una lista de vectores de igual longitud. Una matriz sólo contiene un tipo de datos, mientras que un Data Frame acepta diferentes tipos de datos (numéricos, de caracteres, de factores, etc.).

# ¿Cómo crear un Data Frame?

Podemos crear un Data Frame en R pasando la variables x,y,z,w a la función `data.frame()`. Podemos crear un Data Frame y nombrar las columnas con `name()` o simplemente especificar el nombre de las variables.

## Sintaxis:

```{r eval=FALSE, include=FALSE}
data.frame(df, stringsAsFactors = T)
```

__Argumentos:__

+ df: Puede ser una matriz para convertir como Data Frame o una colección de variables unidos.

+ stringsAsFactors: Convierte strings a factors por defecto.

## Ejemplo:

```{r}
# Vamos a crear vectores de la misma longitud con diferentes datos:
message("\n# Vamos a crear vectores de la misma longitud con diferentes datos:")

## Creamos las variables x,y,z,w:
cat("\n## Creamos las variables x,y,z,w:")
x <- c(1,2,3,4)
y <- c("Nezuko", "Kimetsu", "Katana", "Midoriya")
z <- c(T, F, F, F)
w <- c(12.12,75.32,3.14,2.71)
cat("\n> x:", x, "\n> y:", y, "\n> z:", z, "\n> w:", w)

## Unoir las variables para crear un dataframe:
message("\n## Unoir las variables para crear un dataframe:")

df <- data.frame(x,y,z,w)
cat("\ndf <- data.frame(x,y,z,w)", "\n \nOUTPUT:\n \n")
print(df)


```

Podemos ver que los encabezados de las columnas tienen el mismo nombre que las variables. Podemos cambiar el nombre de las columnas en R con la función `names()`.

```{r}
# Nombrando el data frame:
message("\n# Nombrando el data frame:")

names(df) <- c("N°", "Anime", "Logical", "XP")

print(df)

# Ahora Observemos su estructura con str():
cat("\n# Ahora Observemos su estructura con str():")

str(df)


```

> Nota: De forma predeterminada, el Data Frame devuelve variables string como factor.

# ¿Cómo acceder a los componentes de un Data Frame?

Los componentes de un Data Frame pueden ser accedidos como una lista o como una matriz.


## Accediendo como una lista

Podemos utilizar los operadores `[`, `[[` o `$` para acceder a las columnas del Data Frame.

```{r}
# Acceder a los elemnetos como lista diferentes maneras:
message("\n# Acceder a los elemnetos como lista diferentes maneras:")

cat("\n> df[\"Anime\"]", "\n \nOUTPUT:\n \n")
print(df["Anime"])

cat("\n> df$Anime", "\n \nOUTPUT:\n \n")
print(df$Anime)

cat("\n> df[[\"Anime\"]]", "\n \nOUTPUT:\n \n")
print(df[["Anime"]])

cat("\n> df[[2]]", "\n \nOUTPUT:\n \n")
print(df[[2]])
```

> Nota: El acceso con `[[` o `$` es similar. Sin embargo, difiere para `[` en que, la indexación con `[` nos devolverá un Data Frame pero las otras dos lo reducirán a un vector.

## Accediendo como una matriz

Se puede acceder a los Data Frame como a una matriz proporcionando un índice para la fila y la columna.

Para ilustrar esto, utilizamos conjuntos de datos ya disponibles en R. Los conjuntos de datos disponibles pueden listarse con el comando `library(help = "datasets")`.

Utilizaremos el conjunto de datos de árboles que contiene la circunferencia, la altura y el volumen de los cerezos negros.

Un Data Frame puede ser examinado usando funciones como `str()` y `head()`.

> Nota: df[Fila, Columna]

```{r}
# Veamosla comparación:
message("\n# Veamosla comparación:")

cat("\n> str(df)","\n \nOUTPUT:\n \n")
print(str(df))


cat("\n> head(df)","\n \nOUTPUT:\n \n")
print(head(df))


# Seleccionando la 2da y 3ra fila:
cat("\n# Seleccionando la 2da y 3ra fila:")

cat("\n> df[2:3,","\n \nOUTPUT:\n \n")
print(df[2:3,])


# ordenar por operadores lógicos:
message("\n# ordenar por operadores lógicos:")

cat("\n> df[df <30]","\n \nOUTPUT:\n \n")
df[df <30]



```


Podemos ver en el último caso que el tipo retornado es un vector que extraeremos los datos de una sola columna.
(arriba)
```{r}
# Llamar a los elementos del data frame:
message("\n# Llamar a los elementos del data frame:")

print("Se ve como dataframe no como vector")
cat("\n> df[2:4, 4, drop = F]","\n \nOUTPUT:\n \n")
print(df[2:4, 4, drop = F])
```

# ¿Cómo modificar un Data Frame?

Los Data Frame pueden ser modificados como modificamos las matrices a través de la reasignación.


```{r}
# Observamos nuestro data frame:
print(df)

## Ahora observamos nuestro renombramiento:
cat("\n> df[3, \"Anime\"] <- \"Tanjiro\"","\n \nOUTPUT:\n \n")

df[3, "Anime"] <- "Tanjiro"
print(df[3, "Anime", drop=F])
print(df)
```


## Añadir componentes

Se pueden añadir filas a un Data Frame utilizando la función `rbind()`.

```{r}
# Añandiendo componentes con rbind():
cat("\n# Añandiendo componentes con rbind():")
cat("\n> rbind(df, list(5, \"OneForAll\", T, 9999.99))","\n \nOUTPUT:\n \n")

df <- rbind(df, list(5, "OneForAll", T, 9999.99))
print("Se añaden en orden de Fila")
print(df)
```

Simalarmente podemos añadir columnas con `cbind()`

```{r}
# Añadiendo componentes con cbind():
cat("\n# Añandiendo componentes con cbind():")
cat("\n> rbind(df, list(5, \"OneForAll\", T, 9999.99))","\n \nOUTPUT:\n \n")

df <- cbind(df, Clasificación = c("C+",
                            "C++",
                            "A++", "A+", "B+"))
print("Se añaden en orden de Fila")
print(df)
```

Dado que los Data Frame se implementan como listas, también podemos añadir nuevas columnas mediante simples asignaciones tipo lista.


```{r}
print(df)

# Añadimos una nueva columnas con el operador "$":
message("\n# Añadimos una nueva columnas con el operador \"$\":")

cat("\n> df$Finalizada <- c(\"Si\", \"Si\", \"NO\", \"NO\", \"NO\")]",
    "\n \nOUTPUT:\n \n")

df$Finalizada <- c("SI", "SI", "NO", "NO", "NO")

print(df)
```

## Eliminación de un componente

Las columnas del Data Frame se pueden borrar asignándoles `NULL`.

```{r}
# Eliminemos del data frame a XP:
cat("\n# Eliminemos del data frame a XP:")
print(df)

cat("\n> df$XP <- NULL","\n \nOUTPUT:\n \n")
df$XP <- NULL
print(df)

```