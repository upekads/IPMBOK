email = 'test@gmail.com'
password = '12345678'
password_confirmation = '12345678'
role_id='2'
project_role_id='1'
code='test'


Given(/^One project is already exist in the system$/) do
    Project.create(id: 1, projectcode: 'test project', description: 'test description', status: 'Open')
    ProjectDocument.create(id: 1, pmbok_doc_id: 1, project_id: 1, docname: 'Project Management Plan')
    ProjectDocument.create(id: 2, pmbok_doc_id: 2, project_id: 1, docname: 'Activity Resource Requirements')
    ProjectDocument.create(id: 3, pmbok_doc_id: 3, project_id: 1, docname: 'Change Requests')
    ProjectDocument.create(id: 4, pmbok_doc_id: 4, project_id: 1, docname: 'Human Resources Management Plan')
    ProjectDocument.create(id: 5, pmbok_doc_id: 5, project_id: 1, docname: 'Issue Log')
    ProjectDocument.create(id: 6, pmbok_doc_id: 7, project_id: 1, docname: 'Project Staff Assignments')
    ProjectDocument.create(id: 7, pmbok_doc_id: 8, project_id: 1, docname: 'Resource Calendars')
    ProjectDocument.create(id: 8, pmbok_doc_id: 9, project_id: 1, docname: 'Team Performance Assessments')
    ProjectDocument.create(id: 9, pmbok_doc_id: 10, project_id: 1, docname: 'Work Performance Reports')

    ProjectTeam.create(id: 1, user_id: 1, project_id: 1, project_role_id: 1)
    KnowledgeArea.create(id:4, name: 'Integration Management')
    KnowledgeArea.create(id:5, name: 'Scope Management')
    KnowledgeArea.create(id:6, name: 'Time Management')
    KnowledgeArea.create(id:7, name: 'Cost Management')
    KnowledgeArea.create(id:8, name: 'Quality Management')
    KnowledgeArea.create(id:9, name: 'Human Resource Management')
    KnowledgeArea.create(id:10, name: 'Communication Management')
    KnowledgeArea.create(id:11, name: 'Risk Management')
    KnowledgeArea.create(id:12, name: 'Procurement Management')
    KnowledgeArea.create(id:13, name: 'Stakeholder Management')

    ProcessGroup.create(id:1, name: 'Initiation Process Group')
    ProcessGroup.create(id:2, name: 'Planning Process Group')
    ProcessGroup.create(id:3, name: 'Execution Process Group')
    ProcessGroup.create(id:4, name: 'Monitor and Control Process Group')
    ProcessGroup.create(id:5, name: 'Closing Process Group')

######################################################

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

######################################################

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

######################################################

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
######################################################

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

end

Then(/^I click link for managing document$/) do
  visit projects_path
  click_link 'Manage Documents'
end

Then(/^I can open document which I would like to assign task$/) do
  expect(page).to have_content "Manage Documents"
end

When(/^I click a document link$/) do
  click_link 'Activity Resource Requirements'
end

Then(/^I should see button assign to create and go to assign task page$/) do
  expect(page).to have_content "Activity Resource Requirements"
end

When(/^I click on assign to create button$/) do
  click_button 'Assign to create'
end

Then(/^I fill the form$/) do
  fill_in "task[priority]", with: 'High'
  fill_in "task[comment]", with: 'test comment'
end

Then(/^I click submit button$/) do
  click_button 'Submit'

end

Then(/^I should not see button for assigning a task$/) do
  expect(page).to have_content "One Task is Open for this document."
end



