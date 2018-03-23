class EmailService
  def self.notify_contestants(round)
    @matches = Match.where(round_id: round.id)

    @matches.each_with_index do |mat, i|
      contestant_one = Contestant.find_by(id: mat.contestant_one_id)
      if contestant_one
        if contestant_one.try(:email).present?
          SendgridMailer.send(contestant_one.email, contestant_one, i)
        end
      end

      contestant_two = Contestant.find_by(id: mat.contestant_two_id)
      if contestant_two
        if contestant_two.try(:email).present?
          SendgridMailer.send(contestant_two.email, contestant_two, i)
        end
      end
    end
  end

end