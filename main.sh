# Fetch the Old workflow ID
export OldWorkflowID=$(aws cloudformation \
  list-exports --query "Exports[?Name==\`ID\`].Value" \
  --no-paginate --output text)
echo OldWorkflowID: "${OldWorkflowID}"

# Fetch the stack names
export STACKS=($(aws cloudformation list-stacks --query "StackSummaries[*].StackName" \
  --stack-status-filter CREATE_COMPLETE --no-paginate --output text))
echo Stack names: "${STACKS[@]}"

export OldWorkflowID="${OldWorkflowID}"
export STACKS=[$STACKS]

if [[ "${CIRCLE_WORKFLOW_ID:0:7}" != "${OldWorkflowID}" ]]; then
  aws s3 rm "s3://udapeople-${OldWorkflowID}" --recursive
  aws cloudformation delete-stack --stack-name "udapeople-backend-${OldWorkflowID}"
  aws cloudformation delete-stack --stack-name "udapeople-frontend-${OldWorkflowID}"
fi
