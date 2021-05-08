"__Protocolo:__

+ Daniel Felipe Villa Rengifo

+ Lenguaje: R

+ Tema: Manejo de Data Frames en R 

+ Fuentes:
  
  1. [TutorialsPoint](https://www.tutorialspoint.com/r/r_data_frames.htm)
  
  2. [Statistics Globe](https://statisticsglobe.com/sort-data-frame-in-r-example)"

## ----eval=FALSE, include=FALSE-------------------------------------------------------------
## data.frame(df, stringsAsFactors = T)


## ------------------------------------------------------------------------------------------
# Vamos a crear vectores de la misma longitud con diferentes datos:
message("\n# Vamos a crear vectores de la misma longitud con diferentes datos:")

## Creamos las variables x,y,z,w:
cat("\n## Creamos las variables x,y,z,w:")
x <- c(1,2,3,4)
y <- c("Nezuko", "Kimetsu", "Katana", "Midoriya")
z <- c(T, F, F, F)
w <- c(12.12,75.32,3.14,2.71)
cat("\n> x:", x, "\n> y:", y, "\n> z:", z, "\n> w:", w)

## Unir las variables para crear un dataframe:
message("\n## Unir las variables para crear un dataframe:")

df <- data.frame(x,y,z,w)
cat("\ndf <- data.frame(x,y,z,w)", "\n \nOUTPUT:\n \n")
print(df)




## ------------------------------------------------------------------------------------------
# Nombrando el data frame:
message("\n# Nombrando el data frame:")

names(df) <- c("N°", "Anime", "Logical", "XP")

print(df)

# Ahora Observemos su estructura con str():
cat("\n# Ahora Observemos su estructura con str():")

str(df)

## ------------------------------------------------------------------------------------------
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


## ------------------------------------------------------------------------------------------
# Veamos la comparación:
message("\n# Veamos la comparación:")

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





## ------------------------------------------------------------------------------------------
# Llamar a los elementos del data frame:
message("\n# Llamar a los elementos del data frame:")

print("Se ve como dataframe no como vector")
cat("\n> df[2:4, 4, drop = F]","\n \nOUTPUT:\n \n")
print(df[2:4, 4, drop = F])


## ------------------------------------------------------------------------------------------
# Observamos nuestro data frame:
print(df)

## Ahora observamos nuestro renombramiento:
cat("\n> df[3, \"Anime\"] <- \"Tanjiro\"","\n \nOUTPUT:\n \n")
#df[3, "Anime"] <- "Tanjiro"
df[3, "Anime"] <- c("Tanjiro")
df[3, "Logical"] <-T
df[3, "XP"] <-5.00
print(df[3, "Anime", drop=F])
print(df)


## ------------------------------------------------------------------------------------------
# Añandiendo componentes con rbind():
cat("\n# Añandiendo componentes con rbind():")
cat("\n> rbind(df, list(5, \"OneForAll\", T, 9999.99))","\n \nOUTPUT:\n \n")

df <- rbind(df, list(5, "OneForAll", T, 9999.99))
print("Se añaden en orden de Fila")
print(df)


## ------------------------------------------------------------------------------------------
# Añandiendo componentes con cbind():
cat("\n# Añandiendo componentes con cbind():")
cat("\n> df <- cbind(df, Clasificación = c(\"C+\",
                            \"C++\",
                            \"A++\", \"A+\", \"B+\"))","\n \nOUTPUT:\n \n")

df <- cbind(df, Clasificación = c("C+",
                            "C++",
                            "A++", "A+", "B+"))
print("Se añaden en orden de Fila")
print(df)


## ------------------------------------------------------------------------------------------
# añadir columnas forma alternativa:
message("\n# añadir columnas forma alternativa:")
print(df)

# Añadimos una nueva columnas con el operador "$":
message("\n# Añadimos una nueva columnas con el operador \"$\":")

cat("\n> df$Finalizada <- c(\"Si\", \"Si\", \"NO\", \"NO\", \"NO\")]",
    "\n \nOUTPUT:\n \n")

df$Finalizada <- c("SI", "SI", "NO", "NO", "NO")

print(df)


## ------------------------------------------------------------------------------------------
# Eliminemos del data frame a XP:
cat("\n# Eliminemos del data frame a XP:")
print(df)

cat("\n> df$XP <- NULL","\n \nOUTPUT:\n \n")
df$XP <- NULL
print(df)
