
library(tictoc)

# Function to source a script and measure its execution time
time_script <- function(script_path) {
  tic(paste("Timing", script_path))
  source(script_path)
  toc()
}

# Define the paths to the scripts
script_paths <- c(
  "Scripts/Script_1.r",
  "Scripts/Script_2.r",
  "Scripts/Script_3.r"
)

# Run and time each script
lapply(script_paths, time_script)


# Analysis of Execution Times:

# - Original script (script1): 62.32 seconds
# - Parallel loop script (script2): 47.69 seconds
# - Parallel function script (script3): 38.35 seconds

# Script3, which parallelizes the internal operations of the MTweedieTests function, is the fastest.
# This efficiency is due to more granular parallelism, allowing for better CPU utilization during the 
# computationally intensive simulations. Each simulation can run concurrently, reducing the total 
# execution time despite the overhead of parallel setup. In contrast, script2, which only parallelizes 
# the external loop, doesn't achieve the same level of concurrency, making its performance improvement 
# less pronounced. Overall, the effectiveness of parallel processing is highly dependent on the task 
# granularity and the nature of the computations involved.
