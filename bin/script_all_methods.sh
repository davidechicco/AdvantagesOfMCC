#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#
set -o nounset -o pipefail -o errexit
set -o xtrace


i=1
outputFile=""

random_numberA=$(shuf -i1-100000 -n1)
mkdir -p "../results"
outputFile="../results/all_methods_colon_cancer_classification_test"$random_numberA

/usr/bin/Rscript xgboost_classification.r >> $outputFile

/usr/bin/Rscript svm_radial_classification.r >> $outputFile

/usr/bin/Rscript svm_linear_classification.r >> $outputFile

/usr/bin/Rscript knn_classification.r >> $outputFile

/usr/bin/Rscript cart_classification.r >> $outputFile

echo -e "All the results have been saved in the "$outputFile "\n"

echo -e "\nThe end\n"

