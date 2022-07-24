# export OldWorkflowID=$(aws cloudformation \
#   list-exports --query "Exports[?Name==\`WorkflowID\`].Value" \
#   --no-paginate --output text)
# echo $OldWorkflowID >>./OldWorkflowID.txt
# cat ~/OldWorkflowID.txt

# WorkflowID=$(cat ./OldWorkflowID.txt)
# # echo OldWorkflowID: "${OldWorkflowID}"
# echo WorkflowID: "${WorkflowID}"
