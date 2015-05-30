# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###################################

KnowledgeArea.create(
    id:4,
    name: 'Integration Management'
)

KnowledgeArea.create(
    id:5,
    name: 'Scope Management'
)

KnowledgeArea.create(
    id:6,
    name: 'Time Management'
)


KnowledgeArea.create(
    id:7,
    name: 'Cost Management'
)

KnowledgeArea.create(
    id:8,
    name: 'Quality Management'
)

KnowledgeArea.create(
    id:9,
    name: 'Human Resource Management'
)

KnowledgeArea.create(
    id:10,
    name: 'Communication Management'
)

KnowledgeArea.create(
    id:11,
    name: 'Risk Management'
)

KnowledgeArea.create(
    id:12,
    name: 'Procurement Management'
)

KnowledgeArea.create(
    id:13,
    name: 'Stakeholder Management'
)

###################################

ProjectRole.create(
    id:1,
    rolename: 'Project Manager'
)

ProjectRole.create(
    id:2,
    rolename: 'Project Member'
)



#######################################################3
ProcessGroup.create(
    id:1,
    name: 'Initiation Process Group'

)

ProcessGroup.create(
    id:2,
    name: 'Planning Process Group'

)
ProcessGroup.create(
    id:3,
    name: 'Execution Process Group'

)
ProcessGroup.create(
    id:4,
    name: 'Monitor and Control Process Group'

)
ProcessGroup.create(
    id:5,
    name: 'Closing Process Group'

)

######################################################

#######################################################3

SubprocessGroup.create(
    id:18,
    code: '9.1',
    name:' Plan Human Resource Management',
    process_group_id:2 ,
    knowledge_area_id:9
)



SubprocessGroup.create(
    id:29,
    code: '9.2',
    name:' Acquire Project Team',
    process_group_id:3 ,
    knowledge_area_id:9
)

SubprocessGroup.create(
    id:30,
    code: '9.3',
    name:'  Develop Project Team',
    process_group_id:3 ,
    knowledge_area_id:9
)

SubprocessGroup.create(
    id:31,
    code: '9.4',
    name:' Manage Project Team',
    process_group_id:3 ,
    knowledge_area_id:9
)

SubprocessGroup.create(
    id:3,
    code: '4.2',
    name:' Develop Project Management Plan',
    process_group_id:2 ,
    knowledge_area_id:4
)

SubprocessGroup.create(
    id:35,
    code: '4.4',
    name:' Monitor and Control Project work',
    process_group_id:4 ,
    knowledge_area_id:4
)

SubprocessGroup.create(
    id:36,
    code: '4.5',
    name:' Perform Integrated Change Control',
    process_group_id:4 ,
    knowledge_area_id:4
)

SubprocessGroup.create(
    id:11,
    code: '6.4',
    name:' Estimate Activity Resource',
    process_group_id:2 ,
    knowledge_area_id:6
)

SubprocessGroup.create(
    id:34,
    code: '13.3',
    name:'  Manage Stakeholder Engagement',
    process_group_id:3 ,
    knowledge_area_id:13
)

############################3

PmbokDoc.create(
    id:1,
    name: 'Project Management Plan',
    subprocess_group_id:3

)

PmbokDoc.create(
    id:2,
    name: 'Activity Resource Requirements',
    subprocess_group_id:11

)
PmbokDoc.create(
    id:3,
    name: 'Change Requests',
    subprocess_group_id:36

)
PmbokDoc.create(
    id:4,
    name: 'Human Resources Management Plan',
    subprocess_group_id:18

)
PmbokDoc.create(
    id:5,
    name: 'Issue Log',
    subprocess_group_id:34

)

PmbokDoc.create(
    id:7,
    name: 'Project Staff Assignments',
    subprocess_group_id:29

)
PmbokDoc.create(
    id:8,
    name: 'Resource Calendars',
    subprocess_group_id:29

)
PmbokDoc.create(
    id:9,
    name: 'Team Performance Assessments',
    subprocess_group_id:30

)
PmbokDoc.create(
    id:10,
    name: 'Work Performance Reports',
  subprocess_group_id:35

)

#####################################


  PmbokDocInput.create(
      document_id:4 ,
      inputdocument_id:1,
      subprocess_group_id:18,
      task:'Create'

  )


PmbokDocInput.create(
    document_id:7 ,
    inputdocument_id:4,
    subprocess_group_id:29,
    task:'Create'

)


PmbokDocInput.create(
    document_id:8 ,
    inputdocument_id:4,
    subprocess_group_id:29,
    task:'Create'

)


PmbokDocInput.create(
    document_id:9 ,
    inputdocument_id:4,
    subprocess_group_id:30,
    task:'Create'

)


PmbokDocInput.create(
    document_id:9 ,
    inputdocument_id:7,
    subprocess_group_id:30,
    task:'Create'

)
PmbokDocInput.create(
    document_id:9 ,
    inputdocument_id:8,
    subprocess_group_id:30,
    task:'Create'

)
##################################333

  PmbokDocOutput.create(
      document_id:4 ,
      outputdocument_id:8,
      subprocess_group_id:29,
    task:'Create'

  )

PmbokDocOutput.create(
    document_id:4 ,
    outputdocument_id:7,
    subprocess_group_id:29,
    task:'Create'

)

PmbokDocOutput.create(
    document_id:4 ,
    outputdocument_id:1,
    subprocess_group_id:29,
    task:'Update'

)

PmbokDocOutput.create(
    document_id:7 ,
    outputdocument_id:9,
    subprocess_group_id:30,
    task:'Create'

)

PmbokDocOutput.create(
    document_id:8 ,
    outputdocument_id:9,
    subprocess_group_id:30,
    task:'Create'

)

PmbokDocOutput.create(
    document_id:4 ,
    outputdocument_id:3,
    subprocess_group_id:31,
    task:'Update'

)

PmbokDocOutput.create(
    document_id:7 ,
    outputdocument_id:3,
    subprocess_group_id:31,
    task:'Update'

)

PmbokDocOutput.create(
    document_id:9 ,
    outputdocument_id:3,
    subprocess_group_id:31,
    task:'Update'

)



##########################################333



Role.create(
    title: 'Administrator'

)

Role.create(
    title: 'Manager'
)

Role.create(
    title: 'Normal user'
)
