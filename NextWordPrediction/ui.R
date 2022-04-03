#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(navbarPage(title="Word Prediction App",
                   mainPanel(
                     tabsetPanel(type = 'tabs',
                                 tabPanel("Prediction App", br(),
                                          h4("The predictive text input is using the N-gram model built using 20+ millions of n-grams."),
                                          h4("By typing in phrases or a sentense, there will be a list of suggested words appear, with the highest ranking at the top."),
                                          br(),
                                          textInput(inputId="userinput", label="Type in phrase or sentence:", width="600",
                                                    placeholder="Start typing..."),
                                          h4("Suggested next word:"),
                                          tableOutput("predict")),
                                 tabPanel("Instruction", br(),br(),
                                          h4("This app is simple and intuitive to use."), 
                                          h4("Just type in the first few words of a sentence and the suggested next words will show up at the bottom." 
                                          ),br(),
                                          h4("For coding details please visit Github Repository: (https://github.com/liuliuc/DataScienceCapstone)"
                                          )),
                                 tabPanel("Additional Info", br(),
                                          h3("Overview"),br(),
                                          h4("- This app used N-gram natural language modeling method for the next word prediction."),
                                          h4("Based on the fact how many words were used to build a n-gram, they are called uni-, bi (2), tri(3), four(4) ... n-gram."),
                                          h4("For the project Uni-, Bi-, Tri-, Four- and Five-gram models were built using quanteda."),br(),
                                          h4("- In each N-gram, the frequency of occurence of each word was counted, and the probability (prob)"),
                                          h4("was calculated for a single occurence of word. Those serve as the training dataset."),br(),
                                          h4("- For this application a stupid back-off model is used to determine which N-gram model to use."),
                                          h4("Given an input string, the prediction model uses the last 3 words entered to search the four-gram model."),
                                          h4("If no match was found, it backs off to the last 2 words and uses the tri-gram model."),
                                          h4("If there is still no match the most likely unigram estimates will be choosen.")
                                 )
                     )
                   ))
)
