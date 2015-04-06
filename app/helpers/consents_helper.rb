module ConsentsHelper

  STEP_ORDER = ["new","indications","benefits","risks","alternatives","description"]

  def previous_step(current)
    result = STEP_ORDER.index(current)
    (result.nil? || result == 0) ? STEP_ORDER[0] : STEP_ORDER[result - 1]
  end

  def next_step(current)
    result = STEP_ORDER.index(current)
    (result.nil? || result == STEP_ORDER.count-1) ? STEP_ORDER.last : STEP_ORDER[result + 1]
  end


end