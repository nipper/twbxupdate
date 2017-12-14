#' Updates a Tableau .twbx file with new data.
#'
#' @param files input character vector
#' @return Nothing
#' @export
#' @examples
#' update_twbx("new_data.xlsx","cool_viz.twbx")
update_twbx <- function(files,twbx_file) {

  temp_dir <- ".tableau_temp"

  #Unzip to temp directory
  unzip(twbx_file,exdir = temp_dir)

  #Replace each file
  for (f in files) {
    destination <- list.files(temp_dir,recursive = TRUE,pattern = f,full.names = TRUE)
    if (identical(character(0),destination)) {
      next
    } else {
      file.copy(f,destination,overwrite = TRUE)
    }
  }

  #Zip the folder up
  file.rename(twbx_file,paste0("Old-",twbx_file))
  current_wd <- getwd()
  setwd(temp_dir)
  files_to_zip <- list.files(".",recursive = TRUE,all.files = TRUE)
  zip(paste0("../",twbx_file),files = files_to_zip)
  setwd(current_wd)
  unlink(temp_dir)
}