class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, patient)
        new_appointment = Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def patients
        appointments.map do |appointment|
            appointment.patient
        end
    end

end
