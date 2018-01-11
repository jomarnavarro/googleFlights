# This file defines most possible exceptions that occur in the Heimdall framework
# Heimdall framework Error parent class, which also logs the error.
class HeimdallError < StandardError
  def initialize(message, data = nil)
    super(message)
    @data = data
    to_log_format
  end

  def to_log_format
    { message: message, data: @data, exception: self.class, backtrace: caller }
  end
end

# Defines the error ocurring when a compliance validation is not met.
class ComplianceError < HeimdallError
end

# Defines the error when text is not formatted correctly on the screen, such as
# the font weight, color, etc.
class TextFormatError < ComplianceError
end

# Defines the error when the text content of a web element is not displayed correctly.
class TextContentError < ComplianceError
end

# Defines the Field Presence error whenever a field is expected to be
# present and is not and viceversa.  This falls in the category of compliance
class FieldPresenceError < ComplianceError
end

# Defines the error that occurs when a web element, such as a button,
# a link, etc. is not defined.
class ElementNotDefined < HeimdallError
  def initialize(message = 'Element not defined', data = nil)
    super
  end
end

# Defines the error that occurs when a web element, such as a button,
# a link, etc. is already defined.
class ElementAlreadyDefined < StandardError
end

# Defines the error that occurs when an element is not loaded in the screen.
class ElementNotLoaded < HeimdallError
end

# Defines the error that occurs when an element Descriptor type is not valid,
# i.e. is not a String, a Hash or a Symbol.
class ElementDescriptorError < HeimdallError
  def initialize(message = 'Descriptor type not valid', data = nil)
    super
  end
end

# Defines the error that occurs when an input options is not correct, i.e. when
# a step requires a boolean such as 'true' or 'false' and something else is input.
class InvalidOptionError < HeimdallError
end

# Defines the error when a web element is not in the correct state.
class InvalidElementState < HeimdallError
end
