# Copyright (c) [2021] [Ricardo O. Ramirez Flores]
# roramirezf@uni-heidelberg.de

#' Create pseudobulk profiles from a directory with
#' Seurat data sets.
#' The input of this program requires to define for each data set a column
#' with identity

library(tidyverse)
library(Seurat)
library(optparse)
library(scater)

# Argument definition ---------------------------------------------------------------------------------
option_list <- list(
  make_option(c("--path"), 
              action ="store", 
              default = NULL, 
              type = 'character',
              help = "path where the Seurat object to pseudobulk is"),
  make_option(c("--vars"), 
              action = "store", 
              default = NULL, 
              type = 'character',
              help = "what variables to use as groups"),
  make_option(c("--out_path"), 
              action= "store", 
              default = NULL, 
              type = 'character',
              help = "where to save the rds objects"),
  make_option(c("--collapsed"), 
              action= "store", 
              default = "n", 
              type = 'character',
              help = "should you create combinations of vars?"),
  make_option(c("--def_assay"), 
              action= "store", 
              default = "RNA", 
              type = 'character',
              help = "where should we take the counts")
)

# Parse the parameters ---------------------------------------------------------------------------------
opt <- parse_args(OptionParser(option_list=option_list))

cat("[INFO] Input parameters\n", file=stdout())
for(user_input in names(opt)) {
  if(user_input=="help") next;
  cat(paste0("[INFO] ",user_input," => ",opt[[user_input]],"\n"),file = stdout())
  assign(user_input,opt[[user_input]])
}


# Evaluate parameters -----------------------------------------------
slide_files <- path

# Identify levels of pseudobulking

vars <- set_names(unlist(strsplit(vars, ",")))

# Read data and create pseudobulk profiles at two levels ----------------------------------

get_sample_pseudo <- function(slide_file, vars, group_vars = "n") {
  
  slide <- readRDS(slide_file)
  
  if(group_vars == "n") {
    
    # Creates pseudobulk profile for each var
    bulk_p_data <- map(vars, function(x) { 
      sumCountsAcrossCells(x = GetAssayData(slide, assay = def_assay, slot = "counts"),
                           ids = slide@meta.data[, x])
    })
    
  } else { 
    
    bulk_p_data <- list()
    bulk_p_data[["gex"]] <- sumCountsAcrossCells(x = GetAssayData(slide, assay = def_assay, slot = "counts"),
                                                 ids = DataFrame(slide@meta.data[, vars]))
    
  }
  
  bulk_p_data[["annotations"]] <- slide@meta.data
  
  return(bulk_p_data)
}

pseudobulk_profiles <- map(set_names(slide_files), 
                           get_sample_pseudo, 
                           vars = vars,
                           group_vars = "collapsed")

saveRDS(pseudobulk_profiles, 
        file = out_path)
