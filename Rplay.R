#IMPORTANT NOTE

#If you downloaded and installed R in a location other than the United States, you might encounter some formating issues later in this class due to language differences. To fix this, you will need to type in your R console:
Sys.setlocale("LC_ALL", "C")

#This will only change the locale for your current R session, so please make a note to run this command when you are working on any lectures or exercises that might depend on the English language (for example, the names for the days of the week).


USDA <- read.csv("C:/Users/enilmik/Downloads/USDA.csv")

USDA$HighSodium <- as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm = TRUE))
USDA$HighProtein <- as.numeric(USDA$Protein > mean(USDA$Protein, na.rm = TRUE))
USDA$HighFat <- as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm = TRUE))
USDA$HighCarb <- as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm = TRUE))

# The tapply function takes three arguments
#tapply(argument1, argument2, argument3)
# Group argument 1 by argument 2 and apply argument 3

#To compute the average amount of iron, sorted by high and low protein
tapply(USDA$Iron, USDA$HighProtein, mean, na.rm=TRUE)

mvt <- read.csv("C:/Users/enilmik/Downloads/mvtWeek1.csv")
DateConvert = as.Date(strptime(mvtWeek1$Date, "%m/%d/%y %H:%M"))
mvt$Date = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)