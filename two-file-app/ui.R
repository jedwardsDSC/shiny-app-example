
# Navigation bar ----
ui <- navbarPage(
  
  title = "Palmer Penguins Data Explorer",
  
  # Page 1 - About this app
  tabPanel(title = "About this App",
           
           # adding fluid row with about text ----
           fluidRow(
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
           ), #END of fluid row with about text
           
           fluidRow(
             column(2),
             column(8, leafletOutput("palmer_station_map")),
             column(2)
             
           )
           
           ), # END of page 1 - About this app
  
  # Page 2 - Data exploration 
  tabPanel(title = "Explore the data",
           
           fluidPage(
             
             # Penguin plot sidebarLayout ----
             sidebarLayout(
               
               sidebarPanel(
                 
                 # island pickerInput ----
                 pickerInput(
                   inputId = "penguin_island_input",
                   label = "Select an island(s):",
                   choices = c("Torgersen", "Dream", "Biscoe"),
                   selected = c("Torgersen", "Dream", "Biscoe"),
                   options = pickerOptions(actionsBox = TRUE),
                   multiple = TRUE
                 ), # END island pickerInput
                 
                 # bin number sliderInput ----
                 sliderInput(
                   inputId = "bin_num_input",
                   label = "Select number of bins:",
                   value = 25,
                   max = 100,
                   min = 1
                 ), # END bin number sliderInput
                 
          
               ),
               
               mainPanel(
                 
                 plotOutput(outputId = "flipperLength_histogram_output")
               )
               
               
             ), #END of penguin plot sidebar layout
             
             # penguin table sidebar layout
             sidebarLayout(
               sidebarPanel(
                 checkboxGroupInput(
                   inputId = "year_select",
                   label = "Select year(s)",
                   choices = c(2007,2008,2009),
                   selected = c(2007,2008),
                   
                 ),
                 
               ),
               
               mainPanel(
                 DT::dataTableOutput(outputId = "interactive_table_output"),
               )
             )
             
           ) # END of fluidPage
           
           )
  
) # END of Navbar