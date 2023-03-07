library(shiny)
library(magrittr)

# Define UI
ui <- fluidPage(
    
    # Give the app a title
    titlePanel("Cas9 sgRNA Sequence Converter"),
    
    # Create a text box with the description of what the app does
    fluidRow(
        column(8,
               wellPanel(
                   tags$span("This app converts a Cas9 single guide RNA (sgRNA) sequence, without the NGG PAM, into upper and lower oligo sequences for cloning into Zhang Lab CRISPR plasmids that have undergone digestion with BbsI restriction enzyme.")
               )
        )
    ),
    
    # Create a text input box for the sgRNA sequence
    sidebarLayout(
        sidebarPanel(
            textInput("sgRNA", "Enter sgRNA sequence (without NGG PAM):")
        ),
        
        # Create a button to submit the input and display the output
        mainPanel(
            actionButton("submit", "Submit"),
            verbatimTextOutput("output"),
            HTML("<br><br><a href='https://www.dropbox.com/s/on1c66dq3dr2f48/Cloning%20sgRNA%20oligos%20into%20pX330.docx?dl=0' target='_blank'>Sansam Lab protocol for cloning sgRNA oligos into pX330 plasmids</a>")
        )
    )
)

# Define server
server <- function(input, output) {
    
    reverse_complement <- function(sequence) {
        sequence <- toupper(sequence)
        complement <- gsub("A", "t", sequence)
        complement <- gsub("T", "a", complement)
        complement <- gsub("C", "g", complement)
        complement <- gsub("G", "c", complement)
        splits <- strsplit(complement, "")[[1]]
        reversed <- rev(splits)
        reverse_complement <- paste(reversed, collapse = "")
        return(paste("AAAC", reverse_complement, "C", sep=""))
    }
    
    # Define function to convert sgRNA to oligo sequences
    sgRNA_to_oligo <- function(sequence) {
        upper_oligo <- paste("CACCG", sequence, sep="")
        lower_oligo <- reverse_complement(sequence) %>% toupper
        return(list(upper_oligo, lower_oligo))
    }
    
    # Define action to take when button is pressed
    observeEvent(input$submit, {
        sgRNA_sequence <- input$sgRNA
        oligo_seqs <- sgRNA_to_oligo(sgRNA_sequence)
        output$output <- renderText(paste(
            "Upper oligo sequence:", oligo_seqs[[1]], 
            "\nLower oligo sequence:", oligo_seqs[[2]],
            "\n\n",
            "\n top strand:    5'",toupper(oligo_seqs[[1]]),"     3'",
            "\n                      ", 
            rep("|",nchar(oligo_seqs[[1]])-4) %>% paste(.,collapse=""),
            "\n bottom strand: 3'    ",
            oligo_seqs[[2]] %>%
                toupper %>%
                strsplit(.,"") %>%
                .[[1]] %>%
                rev %>%
                paste(., collapse = ""),
            " 5'"))
    })
}

# Run the app
shinyApp(ui = ui, server = server)
