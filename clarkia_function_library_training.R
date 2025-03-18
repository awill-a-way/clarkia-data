#example of making a function
func_hello <- function() { # create a function with the name func_hello
  print("Hello World!")
}
#try it out!
func_hello()
#now we try to apply it
clarkia_mutate <- function(MONTH, YEAR){
  mutate(year = 2000+"YEAR",
          month = "MONTH")}
#"clarkia_original" is a fake dataset that doesn't exist for the sake of this exercise
clarkia_format <- function(start, end, month, year) {
clarkia_original|>
  select(1:11, "start":"end")|>
  clarkia_mutate("month", "year")
#
colnames(bodfish_Feb13) <- str_remove(string = colnames(bodfish_Feb13), "_\\d." )