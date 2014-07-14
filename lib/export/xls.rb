require 'axlsx'

module Export
  class XLS

    def initialize(project)
      @project = project
    end

    def final_grades
      @students = @project.subject.students
      p = Axlsx::Package.new
      p.workbook.add_worksheet(:name => "Notas") do |sheet|
        header = []
        header <<  "Numero"
        header <<  "Name"
        @project.phases.each do |p|
          header << p.name
        end
        header << "Nota final"
        sheet.add_row header
        @project.subject.students.sort!{|a,b| a.name.downcase <=> b.name.downcase}.each do |s|
          line = []
          line << s.identifier
          line << s.name
          @project.phases.each do |ph|
            line << ph.grade(s.id)
          end
          line << @project.grade(s.id)
          sheet.add_row line
        end
      end
      p.use_shared_strings = true
      p.serialize("public/export/final_grades_#{@project.id}.xlsx")
    end

    def phase_grades phase
      @students = phase.project.subject.students
      p = Axlsx::Package.new
      p.workbook.add_worksheet(:name => "Notas") do |sheet|
        header = []
        header <<  "Numero"
        header <<  "Nome"
        header <<  phase.name
        header <<  "Avaliação final da fase"
        sheet.add_row header
        phase.project.subject.students.sort!{|a,b| a.name.downcase <=> b.name.downcase}.each do |s|
          line = []
          line << s.identifier
          line << s.name
          line << ((phase.grade s.id)||0)*10
          line << phase.grade(s.id)
          sheet.add_row line
        end
      end
      p.use_shared_strings = true
      p.serialize("public/export/phase_#{phase.project.id}_grades_#{phase.project.id}.xlsx")
    end
  end
end
