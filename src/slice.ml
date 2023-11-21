open Date

module type SliceType = sig
  type t
  (** Representation type. *)

  val make :
    string ->
    ?open_price:float ->
    ?high:float ->
    ?low:float ->
    ?adjclose:float ->
    ?close_price:float ->
    ?volume:int ->
    date ->
    t
  (** Initializes and creates a stock Slice. The only required fields are
      [ticker] and [time], whereas the other fields [open_price], [high], [low],
      [adjclose], [close_price], and [volume] are optional arguments, set to
      [0.0] or [0] by default. *)

  val ticker : t -> string
  (** [ticker s] returns the ticker of [s]. *)

  val open_price : t -> float
  (** [open_price s] returns the open price of [s] (at time [time] of slice
      creation). *)

  val high : t -> float
  (** [high s] returns the highest price of [s] (at time [time] of slice
      creation). *)

  val low : t -> float
  (** [low s] returns the lowest price of [s] (at time [time] of slice
      creation). *)

  val close_price : t -> float
  (** [close_price s] returns the closing price of [s] (at time [time] of slice
      creation). *)

  val adjclose : t -> float
  (** [adjclose s] returns the adjusted closing price of [s] (at time [time] of
      slice creation). *)

  val volume : t -> int
  (** [volume s] returns the volume of [s] (at time [time] of slice creation). *)

  val time : t -> date
  (** [time s] returns the timestamp of the *)
end

module Slice = struct
  type t = {
    ticker : string;
    open_price : float;
    high : float;
    low : float;
    close_price : float;
    adjclose : float;
    volume : int;
    time : date;
  }
  (* Representation type. *)

  (** Initializes and creates a stock Slice. The only required fields are
      [ticker] and [time], whereas the other fields [open_price], [high], [low],
      [adjclose], [close_price], and [volume] are optional arguments, set to
      [0.0] or [0] by default. *)
  let make ticker ?(open_price = 0.) ?(high = 0.) ?(low = 0.) ?(adjclose = 0.)
      ?(close_price = 0.) ?(volume = 0) time =
    { ticker; open_price; high; low; adjclose; close_price; volume; time }

  (** [ticker s] returns the ticker of [s]. *)
  let ticker s = s.ticker

  (** [open_price s] returns the open price of [s] (at time [time] of slice
      creation). *)
  let open_price s = s.open_price

  (** [high s] returns the highest price of [s] (at time [time] of slice
      creation). *)
  let high s = s.high

  (** [low s] returns the lowest price of [s] (at time [time] of slice
      creation). *)
  let low s = s.low

  (** [close_price s] returns the closing price of [s] (at time [time] of slice
      creation). *)
  let close_price s = s.close_price

  (** [adjclose s] returns the adjusted closing price of [s] (at time [time] of
      slice creation). *)
  let adjclose s = s.adjclose

  (** [volume s] returns the volume of [s] (at time [time] of slice creation). *)
  let volume s = s.volume

  (** [time s] returns the timestamp of the *)
  let time s = s.time
end