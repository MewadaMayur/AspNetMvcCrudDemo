using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace crud_framework_four_eight.Models
{
    public class ResponseModel
    {
        public bool Success { get; set; } = false;
        public string Message { get; set; }
        public object Data { get; set; }
        public int Result { get; set; }
        public List<object> OutData { get; set; }
        public string[] JsonData { get; set; }
    }
}