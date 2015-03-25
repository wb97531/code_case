require 'rails_helper'

describe Snippet, type: :model do
  it 'snippet should be automatically deleted when associated project is deleted' do
    coder = FactoryGirl.create(:coder, id: 2000)
    project = FactoryGirl.create(:project, coder_id: coder.id, id: 2000)
    FactoryGirl.create(:snippet, coder_id: coder.id, project_id: project.id, id: 2000)

    project.destroy!

    expect { Snippet.find(2000) }.to raise_error ActiveRecord::RecordNotFound
  end
end
